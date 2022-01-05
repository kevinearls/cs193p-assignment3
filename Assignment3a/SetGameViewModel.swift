//
//  SetGameViewModel.swift
//  Assignment3a
//
//  Created by Kevin Earls on 05/01/2022.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    private static func createSetGame() -> SetGameModel {
        return SetGameModel()
    }
    
    @Published private (set) var model = createSetGame()
    
    // MARK - Intent(s)
    func getMessage() -> String {
        return model.getMessage()
    }
}
