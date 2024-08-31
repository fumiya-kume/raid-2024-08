//
//  Repository.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/25.
//

import Foundation
import Combine

class Repository {
    func loadItemData() -> [Item] {
        return [
            Item(id: UUID().uuidString, name: "iPhone 3G", price: 23040, thumbnail: "iPhone 3G"),
            Item(id: UUID().uuidString, name: "iPhone 15 Pro Max", price: 189800, thumbnail: "iPhone 15 Pro Max"),
            Item(id: UUID().uuidString, name: "クラタス スターターキット", price: 120000000, thumbnail: "クラタス スターターキット"),
            Item(id: UUID().uuidString, name: "シャインマスカット", price: 4500, thumbnail: "シャインマスカット"),
            Item(id: UUID().uuidString, name: "ロマネコンティ", price: 2150000, thumbnail: "ロマネコンティ"),
            Item(id: UUID().uuidString, name: "鏡月", price: 1242, thumbnail: "鏡月"),
            Item(id: UUID().uuidString, name: "なわとび", price: 121000, thumbnail: "なわとび"),
            Item(id: UUID().uuidString, name: "腕時計", price: 528000, thumbnail: "腕時計"),
            Item(id: UUID().uuidString, name: "電車の吊り革", price: 1470, thumbnail: "電車の吊り革"),
            Item(id: UUID().uuidString, name: "木魚", price: 4300, thumbnail: "木魚"),
            Item(id: UUID().uuidString, name: "ゴッホひまわり", price: 22000, thumbnail: "ゴッホひまわり"),
            Item(id: UUID().uuidString, name: "サッカーゴール", price: 229000, thumbnail: "サッカーゴール"),
            Item(id: UUID().uuidString, name: "テトラポット", price: 100000, thumbnail: "テトラポット"),
            Item(id: UUID().uuidString, name: "アーロンチェア", price: 255200, thumbnail: "アーロンチェア"),
            Item(id: UUID().uuidString, name: "四季報", price: 2600, thumbnail: "四季報"),
            Item(id: UUID().uuidString, name: "Vision Pro", price: 599800, thumbnail: "Vision Pro"),
        ]

    }
}
