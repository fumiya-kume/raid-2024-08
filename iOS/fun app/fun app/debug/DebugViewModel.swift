//
//  DebugViewModel.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/25.
//

import Foundation

class DebugViewModel: ObservableObject{
    
    
    init() {
        Task{
            await MainActor.run{
            }
        }
    }
}


