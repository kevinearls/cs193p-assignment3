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
    private var threeChosen: Bool {
        get { cardsInPlay.indices.filter({ cardsInPlay[$0].chosen}).threeMatches }
    }
    
    mutating func choose (_ card: Card) {
        print("choose was called")
        // FIXME review rules about when you an choose / unchoose a card -- can't choose something that is already chosen or in a set
        if let chosenIndex = cardsInPlay.firstIndex(where: { $0.id == card.id }) {
            cardsInPlay[chosenIndex].chosen = !card.chosen
        }
        
        if threeChosen {
            // TODO Here is where the rules need to be applied...
            print( "There are three cards chosen")
        }
        
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

        //print("Got \(remainingCards.count) cards in original deck.")
        remainingCards.shuffle()
        cardsInPlay = Array(remainingCards[0...11])
        remainingCards.removeSubrange(0...11)
    }
    
    mutating func drawThree() {
        if remainingCards.count >= 3 {
            cardsInPlay.append(contentsOf: remainingCards[0...2])
            remainingCards.removeSubrange(0...2)
        }
    }
    
    struct Card: Identifiable {
        var color: Color // red, green purple
        var shape: String // TODO: what should this be? - diamond squiggle oval
        var shapeCount: Int // 1,2, 3
        var shading: String // This should probably be an enum of: solid, striped, open
        var chosen: Bool = false
        var inASet: Bool = false
        
        let id: Int
    }
}

extension Array {
    var threeMatches: Bool {
        if self.count == 3 {
            return true
        } else {
            return false
        }
    }
}
