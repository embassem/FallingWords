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

    func makeLanguageGameViewController(language: LanguageGame) -> LanguageGameViewController {
        let viewModel = DefaultLanguageGameViewModel(game: LanguageGame())
        let view = LanguageGameViewController(viewModel)
        return view
    }
}
