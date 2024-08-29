//
//  StandByView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/25.
//

import SwiftUI

struct StandByView: View {
    @ObservedObject private var viewModel = StandByViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack{
                Button("Go Back", action: {
                    presentationMode.wrappedValue.dismiss()
                })
                Text("現在　\(viewModel.standByUserCount)人待機中...")
                NavigationLink("Start!", destination: GameView())
                    .padding(.bottom, 12)
            }.padding()
            ForEach(viewModel.userList){ user in
                ZStack{
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .padding(.horizontal, 18)
                        .foregroundStyle(RadialGradient(colors: [.accentColor,.blue], center: .leading, startRadius: 0, endRadius: 30))
                        .opacity(0.7)
                    Text(user.name)
                }
            }
        }
    }
}

#Preview {
    StandByView()
}

