//
//  GameOverView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/31.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var totalPrice: Int
    @Binding var selectedItems: [Item]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("\(String.localizedStringWithFormat("%d", totalPrice))円")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, UIScreen.main.bounds.height / 4)

                }
                VStack {
                    Image("game over").resizable().aspectRatio(contentMode: .fit).padding()
                    ForEach(selectedItems) { item in
                        Text("\(item.name): \(item.price)").foregroundColor(.white)
                    }
                    NavigationLink(destination: TopView()) {
                        Image("home").resizable().aspectRatio(contentMode: .fit)
                            .frame(alignment: .center).padding()
                    }
                }
            }
            .background(Color.black)
        }
    }
}

#Preview {
    GameOverView(totalPrice: .constant(1000000), selectedItems: .constant([Item(id: UUID().uuidString, name: "iPhone 3G", price: 23040, thumbnail: "iPhone 3G")]))
}
