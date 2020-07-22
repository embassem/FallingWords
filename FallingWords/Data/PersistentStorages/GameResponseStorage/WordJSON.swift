//
//  WordJSON.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

struct WordJSON: Codable {

    let textEng: String?
    let textSpa: String?

    enum CodingKeys: String, CodingKey {
        case textEng = "text_eng"
        case textSpa = "text_spa"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        textEng = try values.decodeIfPresent(String.self, forKey: .textEng)
        textSpa = try values.decodeIfPresent(String.self, forKey: .textSpa)
    }
}

extension WordJSON {
    func toLanguageWordJSON(word: String?, translation: String? ) -> LanguageWordJSON? {
        return LanguageWordJSON(word: word, translation: translation)
    }
}

extension LanguageWordJSON {

    init?(word: String?, translation: String?) {
        guard let fromWord = word ,
            let toTranslation = translation else { return nil }
        self.word = fromWord
        self.translation = toTranslation
    }
}
