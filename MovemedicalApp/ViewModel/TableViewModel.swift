//
//  TableViewModel.swift
//  MovemedicalApp
//
//  Created by Prasad Patil on 4/8/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import Foundation
import UIKit

enum Type {
    case books
    case phones
    case cars
}

protocol Section {
    var type: Type { get }
    var title: String { get }
    var sectionCount: Int { get }
}

class TableViewModel: NSObject {
    var items = [Section]()
    
    override init() {
        super.init()
        guard let data = filedata("Data"), let dataModel = Model(data: data) else {
            return
        }
        
        let books = dataModel.books
        if !books.isEmpty {
            let booksItems = BooksSection(books: books)
            items.append(booksItems)
        }
        
        let cars = dataModel.cars
        if !cars.isEmpty {
            let carsItems = CarsSection(cars: cars)
            items.append(carsItems)
        }
        
        let phones = dataModel.phones
        if !phones.isEmpty {
            let phonesItems = PhonesSection(phones: phones)
            items.append(phonesItems)
        }
    }
}

extension TableViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].sectionCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .books:
            if let item = item as? BooksSection, let cell = tableView.dequeueReusableCell(withIdentifier: "BooksCell", for: indexPath) as? BooksCell {
                cell.item = item.books[indexPath.row]
                return cell
            }
        case .phones:
            if let item = item as? PhonesSection, let cell = tableView.dequeueReusableCell(withIdentifier: "PhonesCell", for: indexPath) as? PhonesCell {
                cell.item = item.phones[indexPath.row]
                return cell
            }
        case .cars:
            if let item = item as? CarsSection, let cell = tableView.dequeueReusableCell(withIdentifier: "CarsCell", for: indexPath) as? CarsCell {
                cell.item = item.cars[indexPath.row]
                return cell
            }
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].title
    }
}

class BooksSection: Section {
    var type: Type {
        return .books
    }
    
    var title: String {
        return "Books"
    }
    
    var sectionCount: Int {
        return books.count
    }
    
    var books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
}

class CarsSection: Section {
    var type: Type {
        return .cars
    }
    
    var title: String {
        return "Cars"
    }
    
    var sectionCount: Int {
        return cars.count
    }
    
    var cars: [Car]
    
    init(cars: [Car]) {
        self.cars = cars
    }
}

class PhonesSection: Section {
    var type: Type {
        return .phones
    }
    
    var title: String {
        return "Phones"
    }
    
    var sectionCount: Int {
        return phones.count
    }
    
    var phones: [Phone]
    
    init(phones: [Phone]) {
        self.phones = phones
    }
    
    
}
