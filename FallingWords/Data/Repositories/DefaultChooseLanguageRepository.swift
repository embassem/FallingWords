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

    func fetchChooseLanguageList(completion: @escaping (Result<[LanguageWord], Error>) -> Void) {
        local.getResponse { (result) in
            switch result {
            case .success(let responseDTO): break
            //completion(.success(responseDTO.map({ $0.toLanguage() })))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
