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
        Text("SET \(game.remainingCards.count) / \(game.cardsInPlay.count)")
            .padding()
        AspectVGrid(items: game.cardsInPlay, aspectRatio: 2/3) { card in
            CardView(card: card).padding(4)
        }
    }
}

struct CardView: View {
    let card: SetGameModel.Card
    
    fileprivate func font(in size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        
        GeometryReader { geometry in
            ZStack {
                shape.fill().foregroundColor(card.color)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth, antialiased: false)
                Text("\(card.id)").font(font(in: geometry.size))
            }
        }
    }
}


private struct DrawingConstants {
    static let cornerRadius:CGFloat = 10.0
    static let lineWidth:CGFloat = 3.0
    static let fontScale:CGFloat = 0.70
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(game: game)
    }
}
