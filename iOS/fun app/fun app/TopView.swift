//
//  TopView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/31.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        NavigationLink(destination: ItemListView()) {
            ZStack{
                Image("title BG").resizable()
                VStack{
                    Image("title").resizable().aspectRatio(contentMode: .fit).padding()
                    Image("start").resizable().aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(alignment: .center)
                }
            }
        }
    }
}

#Preview {
    TopView()
}
