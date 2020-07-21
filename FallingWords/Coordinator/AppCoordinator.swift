//
//  AppCoordinator.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit
import Foundation

protocol Navigators {
    var game: GameNavigator { get set }
}

protocol AppCoordinatorProtocol: class, Navigators {
    func start()
    var navigationController: UINavigationController? { get set }
}

class AppCoordinator: AppCoordinatorProtocol {

    lazy var game: GameNavigator = {
        return GameNavigator(coordinator: self)
    }()

    var navigationController: UINavigationController?

    private let window: UIWindow

    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController = AppNavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }

    func start() {
        let closures = ChooseLanguageViewModelClosures()

        let vc = game.makeLanguageChooseViewController(closures: closures)

        navigationController?.setViewControllers([vc], animated: true)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}
