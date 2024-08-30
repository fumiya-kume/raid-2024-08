//
//  DebugViewModel.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/25.
//

import Foundation

class DebugViewModel: ObservableObject{
    @Published var userList: [User] = []
    @Published var itemList: [Item] = []
    @Published var sessionList: [Session] = []
    
    var repository = Repository()
    
    init() {
        Task{
            await MainActor.run{
                repository.userListener{
                    self.userList = $0
                }
                repository.itemListener{
                    self.itemList = $0
                }
                repository.sessionListener{
                    self.sessionList = $0
                }
            }
        }
    }
    
    func onUserDelete(user:User) {
        repository.userDelete(user: user)
    }
    
    func onItemDelete(item:Item) {
        repository.itemDelete(item: item)
    }
    
    func onUserDeleteAll(){
        repository.userListener{
            $0.forEach{
                self.repository.userDelete(user: $0)
            }
        }
    }
}


