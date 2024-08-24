//
//  Item.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
