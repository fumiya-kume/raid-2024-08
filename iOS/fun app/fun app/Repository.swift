//
//  Repository.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/25.
//

import Foundation
import FirebaseFirestore
import Combine

class Repository {
    func loadItemData() -> [Item] {
        return [
            Item(id: UUID().uuidString, name: "iPhone 14 Pro Max 128GB", price: 164800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro Max 256GB", price: 179800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro Max 512GB", price: 209800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro Max 1TB", price: 239800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro 128GB", price: 149800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro 256GB", price: 164800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro 512GB", price: 194800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro 1TB", price: 224800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Plus 128GB", price: 134800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Plus 256GB", price: 149800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 Plus 512GB", price: 179800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 128GB", price: 119800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 256GB", price: 134800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone 14 512GB", price: 164800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone SE (第3世代) 64GB", price: 62800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone SE (第3世代) 128GB", price: 69800, thumbnail: "apple-logo"),
            Item(id: UUID().uuidString, name: "iPhone SE (第3世代) 256GB", price: 84800, thumbnail: "apple-logo")
        ]
    }
}
