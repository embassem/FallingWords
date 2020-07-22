//
//  LanguageGameRepository.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol LanguageGameRepository {
    func fetchWordListList( completion: @escaping (Result<[LanguageWord], Error>) -> Void)
}
