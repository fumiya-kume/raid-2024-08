//
//  EndView.swift
//  fun app
//
//  Created by Kinoshita Mana on 2024/08/25.
//

import SwiftUI

struct FinishedView: View {
    
    @ObservedObject var viewModel: FinishedViewModel = FinishedViewModel()
    
    var body: some View {
        VStack {
            Text("カレー完成！")
            Text("タイム: \(viewModel.finishedSeconds)秒")
            Image(decorative: "curry")
                 .resizable()
                 .frame(width: 300, height: 150)
        }

    }
}

#Preview {
    FinishedView()
}

