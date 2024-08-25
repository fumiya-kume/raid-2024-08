import ARKit
import RealityKit
import SwiftUI

struct GameView: View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}
struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        // Configure the ARView to generate a mesh
        arView.environment.sceneUnderstanding.options = []
        
        // Turn on occlusion from the scene reconstruction's mesh.
        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        
        // Turn on physics for the scene reconstruction's mesh.
        arView.environment.sceneUnderstanding.options.insert(.physics)
        
        // Display a debug visualization of the mesh.
        arView.debugOptions.insert(.showSceneUnderstanding)
        
        // For performance, disable render options that are not required for this app.
        arView.renderOptions = [.disablePersonOcclusion, .disableDepthOfField, .disableMotionBlur]
        arView.session.delegate = context.coordinator
        
        // Handle ARSession events via delegate
        context.coordinator.arView = arView
        arView.session.delegate = context.coordinator
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> ARCoordinator {
        ARCoordinator()
    }
    
    class ARCoordinator: NSObject, ARSessionDelegate {
//        var model: ModelEntity
        weak var arView: ARView?
        
        override init() {
            // Create a cube model
//            let boxMesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
//            let material = SimpleMaterial(color: .gray, roughness: 0.15, isMetallic: true)
//            model = ModelEntity(mesh: boxMesh, materials: [material])

            super.init()
        }

        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        }
    }
}
