import ARKit
import RealityKit
import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        ZStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .trailing) {
                Spacer()
                Text("\(String(format: "%02d", viewModel.minute)):\(String(format: "%02d", viewModel.second))")
            }
        }
        .onAppear {
            viewModel.start()
        }
        .onDisappear {
            viewModel.stop()
        }
    }
}

struct ARViewContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ARViewController {
        ARViewController()
    }

    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
    }
}
