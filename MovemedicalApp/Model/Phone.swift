//
//  Phone.swift
//  MovemedicalApp
//
//  Created by Prasad Patil on 4/9/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import Foundation

struct Phone {
    var name: String?
    var description: String?
    var brand: String?
    var first_Released: String?
    
    init(json: [String: Any]) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.brand = json["brand"] as? String
        self.first_Released = json["firstReleased"] as? String
    }
}
