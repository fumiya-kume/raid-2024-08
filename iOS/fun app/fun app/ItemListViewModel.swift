//
//  ItemListViewModel.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/31.
//

import Foundation

class ItemListViewModel: ObservableObject{
    @Published var items: [Item] = []
    @Published var selecteditems: [Item] = []
    
    init() {
    
    }
}

struct Item : Identifiable, Codable {
    let id:String
    let name: String
    let price: Int
}
