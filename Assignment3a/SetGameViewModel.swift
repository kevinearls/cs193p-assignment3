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
    
    var cardsInPlay: Array<SetGameModel.Card> { return model.cardsInPlay }
    var remainingCards: Array<SetGameModel.Card> { return model.remainingCards }
    
    // MARK - Intent(s)
    func getMessage() -> String {
        return model.getMessage()
    }
}
