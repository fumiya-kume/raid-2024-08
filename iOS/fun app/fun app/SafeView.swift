//
//  SafeView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/31.
//

import SwiftUI

struct SafeView: View {
    @Binding var isActive: Bool

    var body: some View {
        Text("Safe")
        Button(action: {
            isActive = false
        }) {
            Image("next turn")
        }
    }
}

#Preview {
    SafeView(isActive: .constant(true))
}
