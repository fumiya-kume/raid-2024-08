//
//  TopView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/31.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        Button {
            print()
        } label: {
            Text("スタート！").frame(width: 320, height: 200).foregroundStyle(.black)
        }
        .buttonStyle(.glassmorphism)
    }
}

#Preview {
    TopView()
}
