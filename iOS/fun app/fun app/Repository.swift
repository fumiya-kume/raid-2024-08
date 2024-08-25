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
            let result = try await firestore.collection("sessions").getDocuments()
            let documentsRef = try await firestore.collection("users").getDocuments()
            let count = documentsRef.count
            print(count)
            return count
        } catch {
            return -1
        }
    }
    
    func fetchStartTime() async -> Date? {
        do {
            let sessionsRef = try await firestore.collection("sessions").getDocuments()
            let session = try sessionsRef.documents.map{
                try $0.data(as: Session.self)
            }.first
            return session?.startTime
        } catch {
            print(error)
            return nil
        }
    }
    
    func fetchIsEnd() async -> Bool? {
        do {
            let sessionsRef = try await firestore.collection("sessions").getDocuments()
            let session = try sessionsRef.documents.map{
                try $0.data(as: Session.self)
            }.first
            return session?.isEnded
        } catch {
            print(error)
            return nil
        }
    }
    
    func fetchSession() async -> Session? {
        do {
            let sessionsRef = try await firestore.collection("sessions").getDocuments()
            let session = try sessionsRef.documents.map{
                try $0.data(as: Session.self)
            }.first
            print(session)
            return nil
        } catch {
            print(error)
            return nil
        }
    }
}


struct Session: Codable {
    let startTime: Date
    let users: [DocumentReference]
    let isEnded: Bool
    
    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case isEnded = "is_end"
        case users = "users"
    }
}

struct User:Codable {
    let items: [Item]
}

struct Item:Codable {
    let name: String
    let price: Int
}
