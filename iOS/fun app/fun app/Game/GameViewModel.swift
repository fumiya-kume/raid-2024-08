import Foundation
import Combine

class GameViewModel: ObservableObject{
    @Published var minute: Int = 0
    @Published var second: Int = 0
    @Published var timer: AnyCancellable!

    // タイマーの開始
    func start(_ interval: Double = 1.0){

        if let _timer = timer{
            _timer.cancel()
        }

        timer = Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: ({ _ in
                self.second += 1
                if self.second >= 60 {
                    self.second %= 60
                    self.minute += 1
                }
        }))

    }

    func stop(){
        timer?.cancel()
        timer = nil
    }
}
