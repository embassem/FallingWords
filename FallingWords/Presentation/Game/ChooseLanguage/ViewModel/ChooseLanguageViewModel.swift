//
//  ChooseLanguageViewModel.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

struct ChooseLanguageViewModelClosures {
    let showGameScene: (LanguageChoose) -> Void
}

protocol ChooseLanguageViewModelInput {
    func viewDidLoad()
    func didSelectItem(at index: Int)

    var numberOfSections: Int { get }
    func numberOfItems(for section: Int) -> Int
    func item(for indexPath: IndexPath) -> ChooseLanguageItemViewModel
}

protocol ChooseLanguageViewModelOutput {
    var items: Observable<[ChooseLanguageItemViewModel]> { get }
    var selectedItem: Observable<ChooseLanguageItemViewModel?> { get }
    var error: Observable<String> { get }
    var isEmpty: Bool { get }
    var screenTitle: String { get }
    var errorTitle: String { get }
}

protocol ChooseLanguageViewModel: ChooseLanguageViewModelInput, ChooseLanguageViewModelOutput {}

final class DefaultChooseLanguageViewModel: ChooseLanguageViewModel {

    private let closures: ChooseLanguageViewModelClosures?
    private let chooseLanguageUseCase: ChooseLanguageUseCase

    private var languages: [LanguageChoose] = [] {
        didSet {
            items.value = languages.map(ChooseLanguageItemViewModel.init)
        }
    }

    // MARK: - OUTPUT

    let items: Observable<[ChooseLanguageItemViewModel]> = Observable([])
    var selectedItem: Observable<ChooseLanguageItemViewModel?> = Observable(nil)
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

    func numberOfItems(for section: Int) -> Int {
        return languages.count
    }

    func item(for indexPath: IndexPath) -> ChooseLanguageItemViewModel {
        return items.value[indexPath.item]
    }

    var numberOfSections: Int {
        return 1
    }

}

// MARK: - INPUT. View event methods

extension DefaultChooseLanguageViewModel {

    func viewDidLoad() {
        load()
    }

    func didSelectItem(at index: Int) {
        let selectedLanguage = languages[index]
        closures?.showGameScene(selectedLanguage)
    }

    private func load () {
        chooseLanguageUseCase.execute { (result) in
            switch result {
            case .success(let chooses):
                self.languages = chooses
            case .failure( let error):
                self.error.value = error.localizedDescription
            }
        }
    }
}
