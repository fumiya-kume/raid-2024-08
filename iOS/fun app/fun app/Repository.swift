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
    private let firestore = Firestore.firestore()
    
    func countUser() async -> Int {
        do {
            let documentsRef = try await firestore.collection("users").getDocuments()
            let count = documentsRef.count
            print(count)
            return count
        } catch {
            return -1
        }
    }
}

struct Session {
    let startTime: Date
    let user: [User]
    let isEnded: Bool
}

struct User {
    let items: [Item]
}

struct Item {
    let name: String
    let price: Int
}
