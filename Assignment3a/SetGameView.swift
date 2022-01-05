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
        Text("\(game.getMessage())")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(game: game)
    }
}
