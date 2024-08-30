//
//  TopView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/31.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        ZStack{
            Image("title BG").resizable()
            VStack{
                Image("title").resizable().aspectRatio(contentMode: .fit).padding()
                NavigationLink(destination: ItemListView()) {
                    Image("start").resizable().aspectRatio(contentMode: .fit)
                        .frame(alignment: .center).padding()
                }
            }
        }
    }
}

#Preview {
    TopView()
}
