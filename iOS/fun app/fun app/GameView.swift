import ARKit
import RealityKit
import SwiftUI

struct GameView: View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ARViewController {
        ARViewController()
    }

    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
    }
}
