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
            Item(id: UUID().uuidString, name: "iPhone 3G", price: 23040, thumbnail: "iPhone 3G"),
            Item(id: UUID().uuidString, name: "iPhone 3GS", price: 69120, thumbnail: "iPhone 3GS"),
            Item(id: UUID().uuidString, name: "iPhone 4", price: 46080, thumbnail: "iPhone 4"),
            Item(id: UUID().uuidString, name: "iPhone 4S", price: 46080, thumbnail: "iPhone 4S"),
            Item(id: UUID().uuidString, name: "iPhone 5", price: 61680, thumbnail: "iPhone 5"),
            Item(id: UUID().uuidString, name: "iPhone 5c", price: 95760, thumbnail: "iPhone 5c"),
            Item(id: UUID().uuidString, name: "iPhone 5s", price: 85680, thumbnail: "iPhone 5s"),
            Item(id: UUID().uuidString, name: "iPhone 6", price: 67800, thumbnail: "iPhone 6"),
            Item(id: UUID().uuidString, name: "iPhone 6 Plus", price: 79800, thumbnail: "iPhone 6 Plus"),
            Item(id: UUID().uuidString, name: "iPhone 6s", price: 86800, thumbnail: "iPhone 6s"),
            Item(id: UUID().uuidString, name: "iPhone 6s Plus", price: 98800, thumbnail: "iPhone 6s Plus"),
            Item(id: UUID().uuidString, name: "iPhone SE(第1世代)", price: 52800, thumbnail: "iPhone SE(第1世代)"),
            Item(id: UUID().uuidString, name: "iPhone 7", price: 72800, thumbnail: "iPhone 7"),
            Item(id: UUID().uuidString, name: "iPhone 7 Plus", price: 85800, thumbnail: "iPhone 7 Plus"),
            Item(id: UUID().uuidString, name: "iPhone 8", price: 78800, thumbnail: "iPhone 8"),
            Item(id: UUID().uuidString, name: "iPhone 8 Plus", price: 89800, thumbnail: "iPhone 8 Plus"),
            Item(id: UUID().uuidString, name: "iPhone X", price: 112800, thumbnail: "iPhone X"),
            Item(id: UUID().uuidString, name: "iPhone XR", price: 84800, thumbnail: "iPhone XR"),
            Item(id: UUID().uuidString, name: "iPhone XS", price: 112800, thumbnail: "iPhone XS"),
            Item(id: UUID().uuidString, name: "iPhone XS Max", price: 124800, thumbnail: "iPhone XS Max"),
            Item(id: UUID().uuidString, name: "iPhone 11", price: 74800, thumbnail: "iPhone 11"),
            Item(id: UUID().uuidString, name: "iPhone 11 Pro", price: 106800, thumbnail: "iPhone 11 Pro"),
            Item(id: UUID().uuidString, name: "iPhone 11 Pro Max", price: 119800, thumbnail: "iPhone 11 Pro Max"),
            Item(id: UUID().uuidString, name: "iPhone SE(第2世代)", price: 44800, thumbnail: "iPhone SE(第2世代)"),
            Item(id: UUID().uuidString, name: "iPhone 12", price: 85800, thumbnail: "iPhone 12"),
            Item(id: UUID().uuidString, name: "iPhone 12 Pro", price: 106800, thumbnail: "iPhone 12 Pro"),
            Item(id: UUID().uuidString, name: "iPhone 12 mini", price: 74800, thumbnail: "iPhone 12 mini"),
            Item(id: UUID().uuidString, name: "iPhone 12 Pro Max", price: 117800, thumbnail: "iPhone 12 Pro Max"),
            Item(id: UUID().uuidString, name: "iPhone 13", price: 89818, thumbnail: "iPhone 13"),
            Item(id: UUID().uuidString, name: "iPhone 13 Pro", price: 111636, thumbnail: "iPhone 13 Pro"),
            Item(id: UUID().uuidString, name: "iPhone 13 mini", price: 78909, thumbnail: "iPhone 13 mini"),
            Item(id: UUID().uuidString, name: "iPhone 13 Pro Max", price: 122545, thumbnail: "iPhone 13 Pro Max"),
            Item(id: UUID().uuidString, name: "iPhone SE(第3世代)", price: 57800, thumbnail: "iPhone SE(第3世代)"),
            Item(id: UUID().uuidString, name: "iPhone 14", price: 119800, thumbnail: "iPhone 14"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro", price: 149800, thumbnail: "iPhone 14 Pro"),
            Item(id: UUID().uuidString, name: "iPhone 14 Pro Max", price: 164800, thumbnail: "iPhone 14 Pro Max"),
            Item(id: UUID().uuidString, name: "iPhone 14 Plus", price: 134800, thumbnail: "iPhone 14 Plus"),
            Item(id: UUID().uuidString, name: "iPhone 15", price: 124800, thumbnail: "iPhone 15"),
            Item(id: UUID().uuidString, name: "iPhone 15 Plus", price: 139800, thumbnail: "iPhone 15 Plus"),
            Item(id: UUID().uuidString, name: "iPhone 15 Pro", price: 159800, thumbnail: "iPhone 15 Pro"),
            Item(id: UUID().uuidString, name: "iPhone 15 Pro Max", price: 189800, thumbnail: "iPhone 15 Pro Max")
        ]
    }
}
