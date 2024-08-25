//
//  StandUpView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State var standByFlag = false
    @State private var name = ""
    
    var body: some View {
        TextField("名前", text: $name)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
        Button {
            viewModel.addUser(name: name)
            standByFlag.toggle()
        } label: {
            Text("Stand By")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .fullScreenCover(isPresented: $standByFlag, content: {
            StandByView()
        })
    }
}

#Preview {
    HomeView()
}
