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
        print("choose: \(card)")
        // FIXME review rules about when you an choose / unchoose a card -- can't choose something that is already chosen or in a set
        // If there were three chosen when we got here, unchoose everything
        if threeChosen {
            let chosenCards = cardsInPlay.indices.filter( { cardsInPlay[$0].chosen })
            for index in chosenCards {
                cardsInPlay[index].chosen = false
            }
        }
        
        if let chosenIndex = cardsInPlay.firstIndex(where: { $0.id == card.id }) {
            cardsInPlay[chosenIndex].chosen = !card.chosen
        }
        
        if threeChosen {
            // TODO add shading here if we figure out how to do it
            var isASet = false
            let chosenCards = cardsInPlay.indices.filter( { cardsInPlay[$0].chosen })
            let card1 = cardsInPlay[chosenCards[0]]
            let card2 = cardsInPlay[chosenCards[1]]
            let card3 = cardsInPlay[chosenCards[2]]
            
            let colorWorks = ((card1.color == card2.color) && (card2.color == card3.color)) || ((card1.color != card2.color) && (card1.color != card3.color) && (card2.color != card3.color) )
            let countWorks = ((card1.shapeCount == card2.shapeCount) && (card2.shapeCount == card3.shapeCount))
                || ((card1.shapeCount != card2.shapeCount) && (card1.shapeCount != card3.shapeCount) && (card2.shapeCount != card3.shapeCount) )
            let shapeWorks = ((card1.shape == card2.shape) && (card2.shape == card3.shape)) || ((card1.shape != card2.shape) && (card1.shape != card3.shape) && (card2.shape != card3.shape) )
                                
            print("Colors \(colorWorks) Count \(countWorks) Shapes \(shapeWorks)")
            if colorWorks && countWorks && shapeWorks {
                isASet = true
            }
            if isASet {
                // remove the 3 cards that made up the set, deal 3 new cards
                for index in chosenCards.sorted(by: { $0 > $1 } ) {
                    cardsInPlay.remove(at: index)
                }
                // TODO should we only draw if cardsInPlay.count < 12?
                if cardsInPlay.count < 12 {
                    drawThree()
                }
            }
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
