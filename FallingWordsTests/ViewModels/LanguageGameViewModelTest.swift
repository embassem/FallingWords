//
//  LanguageGameViewModelTest.swift
//  FallingWordsTests
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import XCTest
@testable import FallingWords

class LanguageGameViewModelTest: XCTestCase {
    
    var sut: DefaultLanguageGameViewModel!
    var gameUseCase: LanguageGameUseCaseMock!
    override func setUpWithError() throws {
        let words = Array(LanguageWord.orderedStubs().prefix(3))
        gameUseCase = LanguageGameUseCaseMock()
        let game = LanguageGame(numberOfTries: words.count, words: words )
        sut = DefaultLanguageGameViewModel(game: game, gameUseCase: gameUseCase )
        
        gameUseCase.execute { (result) in
            self.sut.remainingSlots = result.value ?? []
            
        }
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testChooseCorrcet_forCorrectAnswer() {
        sut.currentItem.value = sut.remainingSlots[2]
        XCTAssert(sut.correct.value == 0)
        sut.correctAnswerAction()
        XCTAssert(sut.correct.value == 1)
    }
    
    func testChooseCorrcet_forWrongAnswer() {
        sut.currentItem.value = sut.remainingSlots[1]
        XCTAssert(sut.correct.value == 0)
        XCTAssert(sut.wrong.value == 0)
        sut.correctAnswerAction()
        XCTAssert(sut.correct.value == 0)
        XCTAssert(sut.wrong.value == 1)
    }
    
    func testChooseWrong_forCorrectAnswer() {
        sut.currentItem.value = sut.remainingSlots[2]
        XCTAssert(sut.correct.value == 0)
        XCTAssert(sut.wrong.value == 0)
        sut.wrongAnswerAction()
        XCTAssert(sut.correct.value == 0)
        XCTAssert(sut.wrong.value == 1)
    }
    
    func testChooseWrong_forWrongAnswer() {
        sut.currentItem.value = sut.remainingSlots[2]
        XCTAssert(sut.correct.value == 0)
        XCTAssert(sut.wrong.value == 0)
        sut.wrongAnswerAction()
        XCTAssert(sut.correct.value == 0)
        XCTAssert(sut.wrong.value == 1)
    }
    
    func testChooseNoAnswer_forWrongAnswer() {
        sut.currentItem.value = sut.remainingSlots[2]
        XCTAssert(sut.correct.value == 0)
        XCTAssert(sut.wrong.value == 0)
        XCTAssert(sut.noAnswer.value == 0)
        sut.noAnswerAction()
        XCTAssert(sut.correct.value == 0)
        XCTAssert(sut.wrong.value == 0)
        XCTAssert(sut.noAnswer.value == 1)
    }
    
}
