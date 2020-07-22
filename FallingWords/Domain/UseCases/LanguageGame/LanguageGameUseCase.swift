//
//  DefaultLanguageGameUseCase.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol LanguageGameUseCase {
    func execute(completion: @escaping (Result<[LanguageChoose], Error>) -> Void)
}

final class DefaultLanguageGameUseCase: LanguageGameUseCase {

    private let repository: LanguageGameRepository

    init(repository: LanguageGameRepository) {

        self.repository = repository
    }

    func execute(completion: @escaping (Result<[LanguageChoose], Error>) -> Void) {
    }
}
