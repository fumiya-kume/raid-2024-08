//
//  ItemList.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/31.
//

import SwiftUI

struct ItemListView: View {
    
    @ObservedObject var viewModel: ItemListViewModel = ItemListViewModel()
    @State private var selectedItem: Item? = nil
    @State var showModalSheet = false
    @State var showGameOver = false
    @State var showSafe = false
    
    var body: some View {
        VStack{
            Text("予算")
            Text("100万円！")
        }
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80, maximum: 200))], content: {
                ForEach(viewModel.items.filter{ item in
                    !viewModel.selecteditems.contains{
                        $0.id == item.id
                    }
                }){item in
                    Button {
//                        showModalSheet = true
                        selectedItem = item
                        print(item.name, "クリック!")
                    } label: {
                        VStack {
                            Image(item.thumbnail).resizable().aspectRatio(contentMode: .fit)
                            Text(item.name).font(.caption).lineLimit(1).allowsTightening(true)
                        }
                    }
                    .sheet(item: $selectedItem) { item in
                        VStack {
                            Image(item.thumbnail).resizable().aspectRatio(contentMode: .fit).padding()
                            Text(item.name)
                            Button("購入！") {
                                selectedItem = nil
                                viewModel.onItemSelect(item: item)
                            }
                        }
                        .presentationDetents([.medium])
                    }
                    .fullScreenCover(isPresented: $viewModel.isGameOver) {
                        GameOverView()
                    }
                    .fullScreenCover(isPresented: $viewModel.isSafe) {
                        SafeView(isActive: $viewModel.isSafe)
                    }
                }
            })
        }.padding()
    }
}

#Preview {
    ItemListView()
}
