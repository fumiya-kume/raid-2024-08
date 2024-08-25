//
//  StandByViewModel.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/25.
//

import Foundation

class StandByViewModel: ObservableObject{
    @Published var standByUserCount:Int = 0
    @Published var session: Session? = nil
    @Published var userList: [User] = []
    
    var repository = Repository()
    
    init() {
        Task{
            await MainActor.run{
                repository.userListener{
                    self.standByUserCount = $0.count
                    self.userList = $0
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
