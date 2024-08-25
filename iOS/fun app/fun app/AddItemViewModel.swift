//
//  AddItemViewModel.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/25.
//

import Foundation


class AddItemViewModel: ObservableObject{
    var repository = Repository()
    
    init() {
        Task{
            await MainActor.run{
            }
        }
    }
    
    func addItem(name: String, price: Int){
        repository.addItem(name: name, price: price)
    }
}


