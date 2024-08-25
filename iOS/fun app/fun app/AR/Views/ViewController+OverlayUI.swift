import UIKit
import ARKit

extension ARViewController {

    // MARK: - Overlay UI layout constraints and setup

    func overlayUISetup() {
        setupTrashZone()
    }

    fileprivate func setupTrashZone() {
        trashZone = GradientView(topColor: UIColor.red.withAlphaComponent(0.7).cgColor, bottomColor: UIColor.red.withAlphaComponent(0).cgColor)
        trashZone.translatesAutoresizingMaskIntoConstraints = false
        arView.addSubview(trashZone)
        NSLayoutConstraint.activate([
            trashZone.topAnchor.constraint(equalTo: arView.topAnchor),
            trashZone.leadingAnchor.constraint(equalTo: arView.leadingAnchor),
            trashZone.trailingAnchor.constraint(equalTo: arView.trailingAnchor),
            trashZone.heightAnchor.constraint(equalTo: arView.heightAnchor, multiplier: 0.33)
        ])
        trashZone.alpha = 0
        addCartLabel()
    }

    fileprivate func addCartLabel() {
        // Adding a Delete label to the trashZone for clarity
        let cartLabel = UILabel()
        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        trashZone.addSubview(cartLabel)
        NSLayoutConstraint.activate([
            cartLabel.topAnchor.constraint(equalTo: trashZone.safeAreaLayoutGuide.topAnchor, constant: 5),
            cartLabel.centerXAnchor.constraint(equalTo: trashZone.centerXAnchor)
        ])
        cartLabel.text = "カートに入れる"
        cartLabel.textColor = .white
    }
}
