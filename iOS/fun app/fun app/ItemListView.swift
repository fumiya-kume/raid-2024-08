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
        List{
            ForEach(viewModel.items){ item in
                if(!viewModel.selecteditems.contains{
                    $0.id == item.id
                }){
                    Text(item.name)
                        .onTapGesture {
                            viewModel.onItemSelect(item: item)
                        }
                }
            }
        }
        
    }
}

#Preview {
    ItemListView()
}

