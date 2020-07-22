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
    var navigationController: UINavigationController { get set }
}

class AppCoordinator: NSObject, AppCoordinatorProtocol {

    lazy var game: GameNavigator = {
        return GameNavigator(coordinator: self)
    }()

    var navigationController: UINavigationController

    private let window: UIWindow

    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController = AppNavigationController()) {
        self.window = window
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    func start() {
        let closures = ChooseLanguageViewModelClosures(showGameScene: showGameScene)

        let vc = game.makeLanguageChooseViewController(closures: closures)

        navigationController.setViewControllers([vc], animated: true)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    func showGameScene(language: LanguageChoose) {
        let vc = game.makeLanguageGameViewController(language: language)
        game.navigate(to: vc)
    }

    private func hideNavigationBar(animated: Bool) {
        if animated {
            self.navigationController.setNavigationBarHidden(true, animated: animated)

        } else {
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }

    private func showNavigationBar(animated: Bool) {
        if navigationController.isNavigationBarHidden {
            navigationController.setNavigationBarHidden(false, animated: animated)
        }
    }

}

extension AppCoordinator: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController,
                                     willShow viewController: UIViewController,
                                     animated: Bool) {
        if viewController is  LanguageGameViewController {
            hideNavigationBar(animated: animated)
        } else {
            showNavigationBar(animated: animated)
        }
    }
}
