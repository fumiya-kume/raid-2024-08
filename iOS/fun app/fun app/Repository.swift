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
    
    func fetchStartTime() async -> Date? {
        return await sessionList().first?.startTime
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
    }
    
    func itemListener(listener: @escaping ([Item]) -> Void){
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
    }
    
    func sessionListener(listener: @escaping ([Session]) -> Void){
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
    }
    
    func gameStateListener(listener: @escaping ([GameState]) -> Void){
        let usersRef =  firestore.collection("sessions")
        usersRef.addSnapshotListener{ snapshot, error in
            do {
                if let snapshot = snapshot {
                    let sessionList = try snapshot.documents.map({ document in
                        try document.data(as: Session.self)
                    })
                    let gameState = sessionList.map({ session in
                        GameState(rawValue: session.state)
                    }).filter { $0 != nil }.compactMap { $0 }
                    listener(gameState)
                }
            } catch{
                print("エラーだよ")
            }
        }
    }
    
    func setGameState(gameState:GameState) async {
        if var session = await sessionList().first{
            session.state = gameState.rawValue
            await updateSession(session: session)
        }
    }
    
    func itemDelete(item:Item) {
        do {
            let itemRef = firestore.collection("items")
            if let id = item.id {
                itemRef.document(id).delete()
            }
        }
    }
    
    func userDelete(user: User) {
        do {
            let userRef = firestore.collection("users")
            if let id = user.id {
                userRef.document(id).delete()
            }
        }
    }
    
    func addItem(name:String, price:Int){
        do {
            let itemRef = firestore.collection("items")
            let item = Item(id: nil,name: name, price: price)
            try itemRef.addDocument(from: item)
        } catch{
            print("エラーだよ")
        }
    }
    
    func gameStop() async {
        
    }
    
    func updateSession(session: Session) async {
        do {
            let session = try await firestore.collection("sessions").getDocuments().documents.first
            if let session = session {
                let document = try firestore.collection("sessions").document(session.documentID)
                try await document.setData(session.data(), merge: true)
            }
        } catch {
            
        }
    }
    
    private func sessionList() async -> [Session] {
        do {
            let sessionRef = try await firestore.collection("sessions").getDocuments()
            return try sessionRef.documents.map{
                try $0.data(as: Session.self)
            }
        } catch {
            return []
        }
    }
}


enum GameState:String {
    case Ready = "ready"
    case Game = "game"
    case Result = "result"
}

struct Session: Codable, Identifiable {
    @DocumentID var id: String?
    let startTime: Date
    let users: [DocumentReference]
    var state: String
    
    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case state = "state"
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
