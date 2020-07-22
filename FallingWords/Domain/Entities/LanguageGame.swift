//
//	LanguageWord.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct LanguageWord: Equatable {

    let word: String
    let translation: String
}

struct LanguageChoose {
    let fromLang: String
    let toLang: String
    let words: [LanguageWord]
}

struct LanguageGame {

    let numberOfTries: Int
    let words: [LanguageWord]
}
