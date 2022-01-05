//
//  Assignment3aApp.swift
//  Assignment3a
//
//  Created by Kevin Earls on 05/01/2022.
//

import SwiftUI

@main
struct Assignment3aApp: App {
    private let game = SetGameViewModel()
    var body: some Scene {
        WindowGroup {
            SetGameView(game: game)
        }
    }
}
