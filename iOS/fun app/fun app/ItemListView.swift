//
//  ItemList.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/31.
//

import SwiftUI

struct ItemListView: View {
    
    @ObservedObject var viewModel: ItemListViewModel = ItemListViewModel()
    
    var body: some View {
        Text("目標: 100万円！")
        List {
            ForEach(viewModel.items) { item in
                ForEach(viewModel.items.filter{ item in
                    !viewModel.selecteditems.contains{
                        $0.id == item.id
                    }
                }){ item in
                    Button(action: {
                        let result = viewModel.onItemSelect(item: item)
                        viewModel.isGameOver = result
                        viewModel.isSafe = !result
                    }) {
                        Text(item.name) // itemの表示内容に応じて変更
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.isGameOver) {
            GameOverView()
        }
        .fullScreenCover(isPresented: $viewModel.isSafe) {
            SafeView()
        }
    }
}

#Preview {
    ItemListView()
}
