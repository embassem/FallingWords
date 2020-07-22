//
//  DefaultLanguageGameUseCase.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol LanguageGameUseCase {
    func execute(completion: @escaping (Result<[LanguageWord], Error>) -> Void)
}

final class DefaultLanguageGameUseCase: LanguageGameUseCase {

    private let repository: LanguageGameRepository

    init(repository: LanguageGameRepository) {

        self.repository = repository
    }

    func execute(completion: @escaping (Result<[LanguageWord], Error>) -> Void) {

        repository.fetchWordListList { (result) in
            let words = result.value ?? []
            var translations = words.map({ $0.translation }).shuffled()

            func randomWord() -> String {
                return translations.removeFirst()
            }
            let shufledTranslation = words.map({ LanguageWord(word: $0.word, translation: randomWord()) })
            completion(.success(shufledTranslation))
        }
    }
}
