//
//  SetGameView.swift
//  Assignment3a
//
//  Created by Kevin Earls on 05/01/2022.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SetGameViewModel
    
    var body: some View {
        Text("SET! \(game.remainingCards.count) cards remaining / \(game.cardsInPlay.count) in play")
            .padding()
        AspectVGrid(items: game.cardsInPlay, aspectRatio: 2/3) { card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
        Button("Draw 3", action: game.drawThree)
    }
}

struct CardView: View {
    let card: SetGameModel.Card
    
    fileprivate func font(in size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        let blah:String = "\(card.shapeCount)"
        GeometryReader { geometry in
            ZStack {
                shape.fill().foregroundColor(card.color)
                if card.chosen {
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth * 5, antialiased: false)
                } else {
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth, antialiased: false)
                }
                VStack {
                    Spacer()
                    // FIXME: There must be a better way to do this
                    // TODO: Make rectangles smaller
                    // TODO: Figure out gradients/shading
                    // TODO: Figure out how to flatten/center if there is only one diamond
                    if card.shape == "oval" {
                        ForEach(0..<card.shapeCount, id: \.self) {_ in
                            Circle().foregroundColor(Color.white).padding(DrawingConstants.circlePadding)
                        }
                    } else if card.shape == "diamond" {
                        ForEach(0..<card.shapeCount, id: \.self) {_ in
                            Diamond().foregroundColor(Color.white)
                        }
                    } else if card.shape == "squiggle" {
                        ForEach(0..<card.shapeCount, id: \.self) {_ in
                            Rectangle().scale(x:DrawingConstants.rectangleScale, y:DrawingConstants.rectangleScale).foregroundColor(Color.white)
                        }
                    }
                    Text(blah)
                    
                }
            }
        }
    }
}

private struct DrawingConstants {
    static let cornerRadius:CGFloat = 10.0
    static let lineWidth:CGFloat = 3.0
    static let fontScale:CGFloat = 0.70
    static let circlePadding:CGFloat = 1
    static let rectangleScale:CGFloat = 0.5
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(game: game)
    }
}
