//
//  StandByView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/25.
//

import SwiftUI

struct StandByView: View {
    var body: some View {
        VStack {
            Text("現在○人待機中...")
            Button {
                print("tap start button")
            } label: {
                Text("Start!")
            }
        }
    }
}

#Preview {
    StandByView()
}

