//
//  Car.swift
//  MovemedicalApp
//
//  Created by Prasad Patil on 4/9/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import Foundation

struct Car {
    var name: String?
    var description: String?
    var manufacturer: String?
    
    init(json: [String: Any]) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.manufacturer = json["manufacturer"] as? String
    }
}
