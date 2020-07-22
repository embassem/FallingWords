//
//  LanguageGameUseCaseMock.swift
//  FallingWordsTests
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
@testable import FallingWords

class LanguageGameUseCaseMock: LanguageGameUseCase {
    
    func execute(completion: @escaping (Result<[LanguageWord], Error>) -> Void) {
        completion(.success(LanguageWord.suffledStubs()))
    }
    

}
