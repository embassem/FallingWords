//
//  File.swift
//  FallingWordsTests
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
import XCTest
@testable import FallingWords

class LanguageGameRepositoryMock: LanguageGameRepository {
    func fetchWordListList(completion: @escaping (Result<[LanguageWord], Error>) -> Void) {

        completion(.success(LanguageWord.orderedStubs()))
    }
}
