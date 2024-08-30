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
            NavigationLink(destination: TopView()) {
                Image("home").resizable().aspectRatio(contentMode: .fit)
                    .frame(alignment: .center).padding()
            }
        }
        .background(.black)
    }
}

#Preview {
    GameOverView()
}
