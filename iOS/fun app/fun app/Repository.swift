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
    
    func addUser(name:String) async -> User? {
        do {
            let usersRef = firestore.collection("users")
            let user = User(name: name, items: [])
            try usersRef.addDocument(from: user)
            return user
        } catch {
            return nil
        }
    }
    
    func userListener(listener: @escaping ([User]) -> Void){
        do {
            let usersRef =  firestore.collection("users")
             usersRef.addSnapshotListener{ snapshot, error in
                 do {
                     let userList = try snapshot?.documents.map({
                         try $0.data(as: User.self)
                     })
                     listener(userList ?? [])
                 } catch{
                     print("エラーだよ")
                 }
            }
        } catch{
            print("エラーだよ")
            return
        }
    }
    
    func itemListener(listener: @escaping ([Item]) -> Void){
        do {
            let usersRef =  firestore.collection("items")
             usersRef.addSnapshotListener{ snapshot, error in
                 do {
                     let itemList = try snapshot?.documents.map({
                         try $0.data(as: Item.self)
                     })
                     listener(itemList ?? [])
                 } catch{
                     print("エラーだよ")
                 }
            }
        } catch{
            print("エラーだよ")
            return
        }
    }
    
    func sessionListener(listener: @escaping ([Session]) -> Void){
        do {
            let usersRef =  firestore.collection("sessions")
             usersRef.addSnapshotListener{ snapshot, error in
                 do {
                     let sessionList = try snapshot?.documents.map({
                         try $0.data(as: Session.self)
                     })
                     listener(sessionList ?? [])
                 } catch{
                     print("エラーだよ")
                 }
            }
        } catch{
            print("エラーだよ")
            return
        }
    }
}


struct Session: Codable, Identifiable {
    @DocumentID var id: String?
    let startTime: Date
    let users: [DocumentReference]
    let isEnded: Bool
    
    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case isEnded = "is_end"
        case users = "users"
    }
}

struct User:Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let items: [DocumentReference]
}

struct Item:Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let price: Int
}
