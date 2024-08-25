//
//  FInishedViewModel.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/26.
//

import Foundation

class FinishedViewModel: ObservableObject{
    @Published var finishedSeconds = ""
    
    var repository = Repository()
    
    init() {
        Task{
            await repository.sessionListener{ session in
                if let startTime = session.first?.startTime{
                    self.finishedSeconds = String((startTime.timeIntervalSinceNow))
                }
            }
        }
    }
    
    func addUser(name: String){
        Task{
            await repository.addUser(name: name)
        }
    }
}
