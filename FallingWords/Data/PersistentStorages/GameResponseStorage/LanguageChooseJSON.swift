//
//  LanguageChooseJSON.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

struct LanguageChooseJSON {
    let fromLang: String
    let toLang: String
    let words: [LanguageWordJSON]
}

struct LanguageWordJSON {

    let word: String
    let translation: String
}
