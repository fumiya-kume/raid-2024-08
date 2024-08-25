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
                    Section(header: Text("Item Collection")){
                        ForEach(viewModel.itemList){user in
                            Text(user.name)
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
