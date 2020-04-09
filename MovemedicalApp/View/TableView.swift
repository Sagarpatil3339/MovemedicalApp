//
//  TableView.swift
//  MovemedicalApp
//
//  Created by Prasad Patil on 4/8/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class TableView: UIViewController {
    let table : UITableView = {
        let tableview = UITableView()
        tableview.separatorColor = UIColor.darkGray
        return tableview
    }()
    
    let viewModel = TableViewModel()
    
    override func viewDidLoad() {
        title = "List"
        super.viewDidLoad()
        setTable()
        setView()
    }
    
    func setTable() {
        table.dataSource = viewModel
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        table.register(BooksCell.self, forCellReuseIdentifier: "BooksCell")
        table.register(CarsCell.self, forCellReuseIdentifier: "CarsCell")
        table.register(PhonesCell.self, forCellReuseIdentifier: "PhonesCell")
    }

    
    func setView(){
        view.addSubview(table)
        setConstraints()
    }
    
    func setConstraints() {
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            table.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            table.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        
    }
}
