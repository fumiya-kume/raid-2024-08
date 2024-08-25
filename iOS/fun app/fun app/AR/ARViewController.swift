import UIKit
import RealityKit
import Combine
import ARKit

class ARViewController: UIViewController, ARSessionDelegate {

    // MARK: - Class variable declarations

    var arView: ARView!
//    @IBOutlet weak var messageLabel: MessageLabel!
    var trashZone: GradientView!
//    var shadeView: UIView!
    var resetButton: UIButton!

//    weak var selectedStickyView: StickyNoteView?

//    var lastKeyboardHeight: Double?

    var stickyNotes = [StickyNoteEntity]()

    var subscription: Cancellable!

    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupARView()
        subscription = arView.scene.subscribe(to: SceneEvents.Update.self) { [unowned self] in
            self.updateScene(on: $0)
        }

        arViewGestureSetup()
        overlayUISetup()

        arView.session.delegate = self
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Add observer to the keyboardWillChangeFrameNotification to get the height of the keyboard every time its frame changes.
//        let notificationName = UIResponder.keyboardWillChangeFrameNotification
//        let selector = #selector(keyboardIsPoppingUp(notification:))
//        NotificationCenter.default.addObserver(self, selector: selector, name: notificationName, object: nil)
//
//    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Prevent the screen from being dimmed to avoid interuppting the AR experience.
        UIApplication.shared.isIdleTimerDisabled = true
        reset()
    }

    fileprivate func setupARView() {
        arView = ARView(frame: self.view.bounds)
        self.view.addSubview(arView)

        NSLayoutConstraint.activate([
            arView.topAnchor.constraint(equalTo: self.view.topAnchor),
            arView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            arView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    func updateScene(on event: SceneEvents.Update) {
        let notesToUpdate = stickyNotes.compactMap { !$0.isEditing && !$0.isDragging ? $0 : nil }
        for note in notesToUpdate {
            // Gets the 2D screen point of the 3D world point.
            guard let projectedPoint = arView.project(note.position) else { return }

            // Calculates whether the note can be currently visible by the camera.
            let cameraForward = arView.cameraTransform.matrix.columns.2.xyz
            let cameraToWorldPointDirection = normalize(note.transform.translation - arView.cameraTransform.translation)
            let dotProduct = dot(cameraForward, cameraToWorldPointDirection)
            let isVisible = dotProduct < 0

            // Updates the screen position of the note based on its visibility
            note.projection = Projection(projectedPoint: projectedPoint, isVisible: isVisible)
            note.updateScreenPosition()
        }
    }

    func reset() {
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }

        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])

//
//        guard let configuration = arView.session.configuration else { return }
//        arView.session.run(configuration, options: .removeExistingAnchors)
        for note in stickyNotes {
            deleteStickyNote(note)
        }
    }

    /**
    Hit test the feature point cloud and use any hit as the position of a new StickyNote. Otherwise, display a tip.
     - Tag: ScreenSpaceViewInsertionTag
     */
    fileprivate func addNewSticky(with transform: simd_float4x4) {

        // Get the user's tap screen location.
//        let touchLocation = sender.location(in: arView)

        // Cast a ray to check for its intersection with any planes.
//        guard let raycastResult = arView.raycast(from: .zero, allowing: .estimatedPlane, alignment: .any).first else {
//            messageLabel.displayMessage("No surface detected, try getting closer.", duration: 2.0)
//            return
//        }

        // Create a new sticky note positioned at the hit test result's world position.
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))

        let note = StickyNoteEntity(frame: frame, worldTransform: transform)

        // Center the sticky note's view on the tap's screen location.
        note.setPositionCenter(.zero)

        // Add the sticky note to the scene's entity hierarchy.
        arView.scene.addAnchor(note)

        // Add the sticky note's view to the view hierarchy.
        guard let stickyView = note.view else { return }
        arView.insertSubview(stickyView, belowSubview: trashZone)

        // Enable gestures on the sticky note.
        stickyNoteGestureSetup(note)

        // Save a reference to the sticky note.
        stickyNotes.append(note)

            // Volunteer to handle text view callbacks.
    //        stickyView.textView.delegate = self
    }

    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            // 「ARImageAnchor」だけ取り出す
            guard let imageAnchor = anchor as? ARImageAnchor else {
                continue
            }

            // nameでImageAnchorの名前を取り出し、どの画像が検出されたかを調べる。
            guard let name = imageAnchor.name else {
                continue
            }

            print("⭐️: name: \(name)")

            DispatchQueue.main.async { [weak self] in
                for i in 0..<5 {
                    self?.addNewSticky(with: imageAnchor.transform)
                }
            }
        }
    }

    func session(_ session: ARSession, didFailWithError error: Error) {
        guard error is ARError else { return }

        let errorWithInfo = error as NSError
        let messages = [
            errorWithInfo.localizedDescription,
            errorWithInfo.localizedFailureReason,
            errorWithInfo.localizedRecoverySuggestion
        ]
        let errorMessage = messages.compactMap({ $0 }).joined(separator: "\n")

        DispatchQueue.main.async {
            // Present an alert informing about the error that has occurred.
            let alertController = UIAlertController(title: "The AR session failed.", message: errorMessage, preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Session", style: .default) { _ in
                alertController.dismiss(animated: true, completion: nil)
                self.reset()
            }
            alertController.addAction(restartAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}

