//
//  NetworkDefaults.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import Foundation

struct NetworkDefaults {

    var baseUrl: String = "https://www.nasable.com" // live

    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
}
