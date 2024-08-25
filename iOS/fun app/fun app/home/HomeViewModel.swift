//
//  HomeViewModel.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/26.
//

import Foundation

class HomeViewModel: ObservableObject{
    
    var repository = Repository()
    
    init() {
        Task{
            await MainActor.run{
            }
        }
    }
    
    func addUser(name: String){
        Task{
            await repository.addUser(name: name)
        }
    }
}
