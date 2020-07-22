//
//  GameNavigator.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
import UIKit

class GameNavigator: Navigator {
    var coordinator: AppCoordinatorProtocol

    required init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    enum Destination {
        case list
    }

    func makeLanguageChooseViewController(closures: ChooseLanguageViewModelClosures) -> ChooseLanguageViewController {
        let localStorage = JSONChooseLanguageResponseStorage()
        let repository = DefaultChooseLanguageRepository(local: localStorage)
        let listUseCase = DefaultChooseLanguageUseCase(repository: repository)
        let viewModel = DefaultChooseLanguageViewModel(
            chooseLanguageUseCase: listUseCase,
            closures: closures)
        let view = ChooseLanguageViewController(viewModel: viewModel)
        view.coordinator = coordinator
        return view
    }

    func makeLanguageGameViewController(language: LanguageChoose) -> LanguageGameViewController {
        let numOfTries = 15
        let game = LanguageGame(numberOfTries: numOfTries, words: language.words)
        let repository = DefaultLanguageGameRepository(game: game)
        let useCase = DefaultLanguageGameUseCase(repository: repository)
        let viewModel = DefaultLanguageGameViewModel(game: game, gameUseCase: useCase)
        let view = LanguageGameViewController(viewModel)
        return view
    }
}
