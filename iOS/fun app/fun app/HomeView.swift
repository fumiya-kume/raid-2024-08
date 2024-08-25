//
//  StandUpView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = StandByViewModel()
    @State var standByFlag = false

    var body: some View {
        Button {
            viewModel.addUser(name: "name1") // TODO: フォームからnameを入力する
            standByFlag.toggle()
        } label: {
            Text("Stand By")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .fullScreenCover(isPresented: $standByFlag, content: {
            GameView()
        })
    }
}

#Preview {
    HomeView()
}
