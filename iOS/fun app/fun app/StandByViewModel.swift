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
    
    var repository = Repository()
    
    init() {

    }
    
    func fetchStandByUserCount() -> Int {
        Task{
            self.standByUserCount = await repository.countUser()
        }
        return self.standByUserCount
    }
}
