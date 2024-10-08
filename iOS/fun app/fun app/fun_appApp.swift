//
//  fun_appApp.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/24.
//

import SwiftUI
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
}

@main
struct fun_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ItemListView()
        }
    }
}
