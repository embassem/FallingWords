//
//  ChooseLanguageViewModel.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

struct ChooseLanguageViewModelClosures {
    //let showGameScene: (Language) -> Void
}

protocol ChooseLanguageViewModelInput {
    func viewDidLoad()
    func didSelectItem(at index: Int)
}

protocol ChooseLanguageViewModelOutput {
    var items: Observable<[ChooseLanguageItemViewModel]> { get }
    var error: Observable<String> { get }
    var isEmpty: Bool { get }
    var screenTitle: String { get }
    var errorTitle: String { get }
}

protocol ChooseLanguageViewModel: ChooseLanguageViewModelInput, ChooseLanguageViewModelOutput {}

final class DefaultChooseLanguageViewModel: ChooseLanguageViewModel {

    private let closures: ChooseLanguageViewModelClosures?
    private let chooseLanguageUseCase: ChooseLanguageUseCase

    private var languages: [LanguageWord] = [] {
        didSet {
            //items.value = languages.map(ItemViewModel.init)
        }
    }

    // MARK: - OUTPUT

    let items: Observable<[ChooseLanguageItemViewModel]> = Observable([])
    let error: Observable<String> = Observable("")
    var isEmpty: Bool { return items.value.isEmpty }
    let screenTitle = NSLocalizedString("Choose The Language", comment: "")
    let errorTitle = NSLocalizedString("Error", comment: "")

    // MARK: - Init

    init(chooseLanguageUseCase: ChooseLanguageUseCase,
         closures: ChooseLanguageViewModelClosures) {
        self.closures = closures
        self.chooseLanguageUseCase = chooseLanguageUseCase
    }

    // MARK: - Private

    private func handle(error: Error) {
        self.error.value = error.localizedDescription
    }

}

// MARK: - INPUT. View event methods

extension DefaultChooseLanguageViewModel {

    func viewDidLoad() {
        //load()
    }

    func didSelectItem(at index: Int) {

    }
}
