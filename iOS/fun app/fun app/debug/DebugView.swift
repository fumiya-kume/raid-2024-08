//
//  DebugView.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/25.
//

import Foundation
import SwiftUI

struct DebugView: View {
    @State var standByFlag = false
    @ObservedObject var viewModel = DebugViewModel()
    
    var body: some View {
        NavigationView(content: {
            VStack{
                List{
                    Section(header: Text("link集")){
                        NavigationLink{
                            HomeView()
                        }label:{
                            Text("Home")
                        }
                        NavigationLink{
                            StandByView()
                        }label:{
                            Text("Stand by")
                        }
                        NavigationLink{
                            StandByView()
                        }label:{
                            Text("Game")
                        }
                        NavigationLink{
                            FinishedView()
                        }label:{
                            Text("Finishd")
                        }
                    }
                    Section(header: Text("Item Collection")){
                        ForEach(viewModel.itemList){ user in
                            HStack{
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(user.name)
                                        .foregroundColor(.primary)
                                        .font(.headline)
                                    HStack(spacing: 0){
                                        Label(String(user.price), systemImage: "chineseyuanrenminbisign")
                                            .foregroundColor(.secondary).font(.subheadline)
                                    }
                                }
                            }
                        }.onDelete(perform: { indexSet in
                            viewModel.onItemDelete(item: viewModel.itemList[indexSet.first!])
                        })
                        NavigationLink("追加"){
                            AddItemView()
                        }
                        
                    }
                    
                    Section(header: Text("User Collection")){
                        ForEach(viewModel.userList){user in
                            Text(user.name)
                        }
                    }
                    
                    Section(header: Text("Session Collection")){
                        ForEach(viewModel.sessionList){user in
                            Text("is ended:" + user.isEnded.description)
                        }
                    }
                }
                
                Button(action: {
                    
                }, label: {
                    Text("更新")
                })
            }
        })
    }
}

#Preview {
    DebugView()
}
