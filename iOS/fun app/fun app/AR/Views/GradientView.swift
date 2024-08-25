import UIKit

// MARK: - Convenient class to make a simple top/bottom gradient view, not essential to this sample

class GradientView: UIView {

    init(topColor: CGColor, bottomColor: CGColor) {
        super.init(frame: .zero)
        let gradientLayer = layer as? CAGradientLayer
        gradientLayer?.colors = [
            topColor,
            bottomColor
        ]
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

}
