//
//  LanguageGameUseCaseTest.swift
//  FallingWordsTests
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import XCTest
@testable import FallingWords

class LanguageGameUseCaseTest: XCTestCase {

    var sut: DefaultLanguageGameUseCase!
    var repo = LanguageGameRepositoryMock()
    override func setUpWithError() throws {
        sut = DefaultLanguageGameUseCase(repository: repo)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {

        let exp = expectation(description: "data should be shuffled")
        var words: [LanguageWord]!
        var repowords: [LanguageWord]!
        sut.execute { (result) in
            words = result.value ?? []

            self.repo.fetchWordListList { (reporesult) in
                repowords = reporesult.value ?? []
                exp.fulfill()
            }

        }

        waitForExpectations(timeout: 3)

        let firstWord = words.first
        let lastWord = words.last

        let firstRepotrans = repowords.first(where: { $0.word == firstWord?.word })?.translation
        let lastRepoTrans = repowords.first(where: { $0.word == lastWord?.word })?.translation

        print(firstWord?.translation == firstRepotrans)
        print(lastWord?.translation == lastRepoTrans)
        let notEqual = (firstWord?.translation == firstRepotrans) && (lastWord?.translation == lastRepoTrans)

        XCTAssertFalse(notEqual, "data has not been equal to repo data")
    }
}
