//
//  JSONChooseLanguageResponseStorage.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation
final class JSONChooseLanguageResponseStorage {

}

extension JSONChooseLanguageResponseStorage: ChooseLanguageResponseStorage {

    func getResponse(completion: @escaping (Result<[WordJSON], Error>) -> Void) {

        let container = Bundle.main.decode([WordJSON].self, from: "words.json")

        completion(.success(container) )
        return
    }
}
