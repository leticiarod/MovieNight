//
//  Company.swift
//  MovieNight
//
//  Created by Leticia Rodriguez on 10/17/17.
//  Copyright © 2017 Leticia Rodriguez. All rights reserved.
//

import Foundation

struct Company {
    let id: Int
    let name: String
}

extension Company {
    
    init?(json: [String: Any]){
        struct Key {
            static let id = "id"
            static let name = "name"
        }
        guard let id = json[Key.id] as? Int,
            let name = json[Key.name] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
        
    }
}
