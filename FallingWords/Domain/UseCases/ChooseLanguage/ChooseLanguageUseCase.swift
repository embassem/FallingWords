//
//  DefaultChooseLanguageUseCase.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol ChooseLanguageUseCase {
    func execute( completion: @escaping (Result<[LanguageChoose], Error>) -> Void)
}

final class DefaultChooseLanguageUseCase: ChooseLanguageUseCase {

    private let repository: ChooseLanguageRepository

    init(repository: ChooseLanguageRepository) {

        self.repository = repository
    }

    func execute( completion: @escaping (Result<[LanguageChoose], Error>) -> Void) {

        return repository.fetchChooseLanguageList { (result) in
            completion(result)
        }
    }
}
