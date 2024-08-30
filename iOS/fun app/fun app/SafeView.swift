//
//  SafeView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/31.
//

import SwiftUI

struct SafeView: View {
    @State private var isPresented: Bool = false

    var body: some View {
        Text("Safe")
        Button(action: {
            isPresented = true
        }) {
            Image("next turn")
        }
        .fullScreenCover(isPresented: $isPresented) {
            ItemListView()
        }
    }
}

#Preview {
    SafeView()
}
