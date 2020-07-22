//
//  LanguageWord+Stubs.swift
//  FallingWordsTests
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
import XCTest
@testable import FallingWords

extension LanguageWord {
    static func orderedStubs () -> [LanguageWord] {

        let bell = LanguageWord(word: "bell", translation: "timbre")

        let aclass = LanguageWord(word: "class", translation: "curso")
        let group = LanguageWord(word: "group", translation: "grupo")
        let other1 = LanguageWord(word: "teacher", translation: "profesor")
        let other2 = LanguageWord(word: "pupil", translation: "alumno")
        let other3 = LanguageWord(word: "quiet", translation: "quieto")
        let other4 = LanguageWord(word: "trick", translation: "jugarreta")

        return [bell, aclass, group, other1, other2, other3, other4 ]
    }
    
    static func suffledStubs () -> [LanguageWord] {
        
        let bell = LanguageWord(word: "bell", translation: "curso")
        
        let aclass = LanguageWord(word: "class", translation: "timbre")
        let group = LanguageWord(word: "group", translation: "grupo")        
        return [bell, aclass, group]
    }
}
