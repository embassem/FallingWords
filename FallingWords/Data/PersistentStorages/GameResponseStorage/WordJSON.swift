//
//  WordJSON.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

struct WordJSON: Codable {

}

extension WordJSON {
    func toLanguageWord() -> LanguageWord {
        return LanguageWord()
    }
}
