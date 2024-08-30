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
    @Published var totalPrice: Int = 0
    @Published var limitPrice: Int = 100000
    @Published var isGameOver: Bool = false
    @Published var isSafe: Bool = false
    
    init() {
        self.items = Repository().loadItemData()
    }
    
    func onItemSelect(item: Item) {
        self.selecteditems.append(item)
        
        self.totalPrice = selecteditems.reduce(0) { (sum, item) in
            sum + item.price
        }
        print(totalPrice)
        
        self.isGameOver = totalPrice > limitPrice
        self.isSafe = !self.isGameOver
    }
}

struct Item : Identifiable, Codable {
    let id:String
    let name: String
    let price: Int
    let thumbnail: String
}
