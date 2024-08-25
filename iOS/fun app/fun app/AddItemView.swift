//
//  AddItemView.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/25.
//

import Foundation
import SwiftUI

struct AddItemView: View {
    @ObservedObject var viewModel = AddItemViewModel()
    @State private var itemName = ""
    @State private var itemPrice = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            TextField("アイテム名", text: $itemName)
            TextField("価格", text: $itemPrice)
                .keyboardType(.numberPad)
        }
        
        Button("送信"){
            viewModel.addItem(name: itemName, price: Int(itemPrice)!)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    AddItemView()
}
