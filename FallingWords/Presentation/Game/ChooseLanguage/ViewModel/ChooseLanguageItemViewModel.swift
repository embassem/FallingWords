//
//  ChooseLanguageItemViewModel.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

struct ChooseLanguageItemViewModel: Equatable {

    let fromLang: String
    let toLang: String
    let words: [WordItemViewModel]

}

extension ChooseLanguageItemViewModel {

    init(choose: LanguageChoose) {
        self.fromLang = choose.fromLang
        self.toLang = choose.toLang
        self.words = choose.words.map(WordItemViewModel.init)
    }
}

struct WordItemViewModel: Equatable {

    let word: String
    let translation: String
}

extension WordItemViewModel {

    init (domain: LanguageWord) {
        self.word = domain.word
        self.translation = domain.translation
    }
}
