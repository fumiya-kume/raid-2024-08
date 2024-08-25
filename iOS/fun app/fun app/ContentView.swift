//
//  ContentView.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Button(viewModel.buttonText) {
            viewModel.updateButtonName()
        }
    }
}

#Preview {
    ContentView()
}
