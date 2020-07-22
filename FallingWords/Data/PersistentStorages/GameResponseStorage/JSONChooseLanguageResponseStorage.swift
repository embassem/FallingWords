//
//  JSONChooseLanguageResponseStorage.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
final class JSONChooseLanguageResponseStorage: ChooseLanguageResponseStorage {

    func getResponse(completion: @escaping (Result<[LanguageChooseJSON], Error>) -> Void) {

        let container = Bundle.main.decode([WordJSON].self, from: "words.json")

        let engToSpaWords = container.compactMap({ $0.toLanguageWordJSON(word: $0.textEng, translation: $0.textSpa ) })
        let engToSpa = LanguageChooseJSON(fromLang: "English", toLang: "Spanish", words: engToSpaWords)
        let spaToEngWords = container.compactMap({ $0.toLanguageWordJSON(word: $0.textSpa, translation: $0.textEng ) })
        let spaToEng = LanguageChooseJSON(fromLang: "Spanish", toLang: "English", words: spaToEngWords)

        completion(.success([engToSpa, spaToEng]) )
        return
    }
}
