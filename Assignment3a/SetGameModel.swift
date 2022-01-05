//
//  SetGameModel.swift
//  Assignment3a
//
//  Created by Kevin Earls on 05/01/2022.
//

import SwiftUI
import Foundation

struct SetGameModel {
    private (set) var cardsInPlay: Array<Card>
    private (set) var remainingCards: Array<Card>
    
    func getMessage() -> String {
        return "This is from the model"
    }
    
    init() {
        remainingCards = []
        cardsInPlay = []
        
        let colors = [Color.red, Color.green, Color.purple]
        let shapes = ["diamond", "squiggle", "oval"]
        let shadings = ["solid", "striped", "open" ]
        remainingCards = []
        var index = 0
        for i in 1...3 {
            for color in colors {
                for shape in shapes {
                    for shading in shadings {
                        let card = Card(color: color, shape: shape, shapeCount: i, shading: shading, id: index)
                        remainingCards.append(card)
                        index += 1
                    }
                }
            }
        }

        print("Got \(remainingCards.count) cards in original deck.")
        remainingCards.shuffle()
        cardsInPlay = Array(remainingCards[0...11])
        remainingCards.removeSubrange(0...11)
    }
    
    struct Card: Identifiable {
        var color: Color // red, green purple
        var shape: String // TODO: what should this be? - diamond squiggle oval
        var shapeCount: Int // 1,2, 3
        var shading: String // This should probably be an enum of: solid, striped, open
        
        let id: Int
    }
}
