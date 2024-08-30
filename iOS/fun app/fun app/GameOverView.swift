//
//  GameOverView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/31.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack{
            Image("game over").resizable().aspectRatio(contentMode: .fit).padding()
            Image("home").resizable().aspectRatio(contentMode: .fit).padding(42)
        }
        .background(.black)
        .onTapGesture {
            self.presentation.wrappedValue.dismiss()
            self.presentation.wrappedValue.dismiss()
        }
    }
}

#Preview {
    GameOverView()
}
