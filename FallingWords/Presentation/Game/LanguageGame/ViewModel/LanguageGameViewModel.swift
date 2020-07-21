//
//  LanguageGameViewModel.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol LanguageGameViewModelOutput {

    var state: Observable <GameState> { get }
    var error: Observable<String> { get }

}

protocol LanguageGameViewModel: LanguageGameViewModelOutput {}

enum GameState {
    case intial
    case minimum
    case full(photos: Bool)
}

class DefaultLanguageGameViewModel: LanguageGameViewModel {

    var game: LanguageGame
    var state: Observable<GameState> = Observable(.intial)
    var error: Observable<String> = Observable("")
    //    var gameUseCase: GameUseCase

    init(game: LanguageGame /*, gameUseCase:GameUseCase*/) {
        self.game = game
        state.value = .minimum
    }
}
