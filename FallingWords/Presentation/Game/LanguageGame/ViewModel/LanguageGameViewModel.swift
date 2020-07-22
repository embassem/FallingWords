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
    var currentItem: Observable<LanguageWord?> { get }
    var remaining: Observable <Int> { get }
    var correct: Observable <Int> { get }
    var wrong: Observable <Int> { get }
    var noAnswer: Observable <Int> { get }
    var total:Int { get }
}
protocol LanguageGameViewModelInput {
    func viewDidLoad()
    func noAnswerAction()
    func correctAnswerAction()
    func wrongAnswerAction()
    func backAction()
}

protocol LanguageGameViewModel: LanguageGameViewModelOutput, LanguageGameViewModelInput {}

enum GameState {
    case intial
    case ended
}

class DefaultLanguageGameViewModel: LanguageGameViewModel {
    
    var remaining: Observable<Int> = Observable(0)
    
    var correct: Observable<Int> = Observable(0)
    
    var wrong: Observable<Int> = Observable(0)
    
    var noAnswer: Observable<Int> = Observable(0)
    
    func viewDidLoad() {
        startGame()
    }
    
    func noAnswerAction() {
        noAnswer.value += 1
        play()
    }
    
    func correctAnswerAction() {
        validateAnswer(chooseCorrect: true)
        play()
    }
    
    func wrongAnswerAction() {
        validateAnswer(chooseCorrect: false)
        play()
    }
    
    func backAction() {
        
    }
    
    var game: LanguageGame
    var state: Observable<GameState> = Observable(.intial)
    var error: Observable<String> = Observable("")
    var gameUseCase: LanguageGameUseCase
    var currentItem: Observable<LanguageWord?> = Observable(nil)
    var remainingSlots: [LanguageWord] = []
    
    var total: Int {
        return correct.value + wrong.value + noAnswer.value
    }
    init(game: LanguageGame, gameUseCase: LanguageGameUseCase) {
        self.game = game
        self.gameUseCase = gameUseCase
    }
    
    private func startGame() {
        gameUseCase.execute { (result) in
            self.remainingSlots = result.value ?? []
            self.play()
        }
    }
    
    private func play() {
        remaining.value = remainingSlots.count
        if remainingSlots.isEmpty {
            currentItem.value = nil
            gameEnded()
            return
        }
        
        let option = remainingSlots.removeFirst()
        
        currentItem.value = option
    }
    
    private func gameEnded() {
        self.state.value = .ended

    }
    
    func validateAnswer(chooseCorrect:Bool) {
        guard let correctWord = game.words.first(where: {$0.word == currentItem.value?.word}),
            let translation = currentItem.value?.translation else {
                return
        }
        
        if correctWord.translation == translation {
            if chooseCorrect == true {
                correct.value += 1
            } else {
                wrong.value += 1
            }
        } else {
            if chooseCorrect == true {
                wrong.value += 1
            } else {
                correct.value += 1
            }
        }
    }
}
