//
//  DefaultChooseLanguageRepository.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

final class DefaultChooseLanguageRepository {

    private let local: ChooseLanguageResponseStorage

    init(local: ChooseLanguageResponseStorage) {
        self.local = local
    }
}

extension DefaultChooseLanguageRepository: ChooseLanguageRepository {

    func fetchChooseLanguageList(completion: @escaping (Result<[LanguageChoose], Error>) -> Void) {
        local.getResponse { (result) in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.map(LanguageChoose.init)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension LanguageChoose {

    init(local: LanguageChooseJSON) {
        self.fromLang = local.fromLang
        self.toLang = local.toLang
        self.words = local.words.map(LanguageWord.init)
    }
}

extension LanguageWord {
    init(local: LanguageWordJSON) {
        self.word = local.word
        self.translation = local.translation
    }
}
