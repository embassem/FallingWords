//
//  ChooseLanguageRepository.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

protocol ChooseLanguageRepository {
    func fetchChooseLanguageList( completion: @escaping (Result<[LanguageChoose], Error>) -> Void)
}
