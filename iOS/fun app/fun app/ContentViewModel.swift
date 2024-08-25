//
//  ContentViewModel.swift
//  fun app
//
//  Created by Fumiya Kume on 2024/08/25.
//

import Foundation

class ContentViewModel: ObservableObject{
    @Published var buttonText:String = "Click me"
    @Published var session: Session? = nil
    
    var repository = Repository()
    
    init() {

    }
    
    func updateButtonName(){
        buttonText = "Clicked"
        Task{
            await repository.fetchSession()
        }
    }
}
