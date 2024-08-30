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
                            FinishedView()
                        }label:{
                            Text("Finishd")
                        }
                    }
                    
                }
            }
        })
    }
}

#Preview {
    DebugView()
}
