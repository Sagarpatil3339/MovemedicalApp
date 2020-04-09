//
//  Model.swift
//  MovemedicalApp
//
//  Created by Prasad Patil on 4/8/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import Foundation

class Model {
    var books = [Book]()
    var cars = [Car]()
    var phones = [Phone]()
    
    init?(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any], let body = json["data"] as? [String: Any] {                
                if let books = body["books"] as? [[String: Any]] {
                    self.books = books.map { Book(json: $0) }
                }
                if let phones = body["phones"] as? [[String: Any]] {
                    self.phones = phones.map { Phone(json: $0) }
                }
                if let cars = body["cars"] as? [[String: Any]] {
                    self.cars = cars.map { Car(json: $0) }
                }
            }
        } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
    }
}

public func filedata(_ filename: String) -> Data? {
    @objc class FileClass: NSObject { }
    
    let bundle = Bundle(for: FileClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return (try? Data(contentsOf: URL(fileURLWithPath: path)))
    } else {
    return nil
    }
}

