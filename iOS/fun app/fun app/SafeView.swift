//
//  SafeView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/31.
//

import SwiftUI

struct SafeView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        VStack{
            Image("clear").resizable().aspectRatio(contentMode: .fit)
            Image("next turn").resizable().aspectRatio(contentMode: .fit)
        }
        .onTapGesture {
            isActive = false
        }
        .padding()
    }
}

#Preview {
    SafeView(isActive: .constant(true))
}
