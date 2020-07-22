//
//  DefaultLanguageGameRepository.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

final class DefaultLanguageGameRepository {

    let game: LanguageGame

    init(game: LanguageGame) {
        self.game = game

    }
}

extension DefaultLanguageGameRepository: LanguageGameRepository {
    func fetchWordListList(completion: @escaping (Result<[LanguageWord], Error>) -> Void) {
        let randomWords = Array(game.words.shuffled().prefix(game.numberOfTries))
        completion(.success(randomWords))
    }

}
