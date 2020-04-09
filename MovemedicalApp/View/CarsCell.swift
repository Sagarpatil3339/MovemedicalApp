//
//  CarsCell.swift
//  MovemedicalApp
//
//  Created by Prasad Patil on 4/9/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class CarsCell: UITableViewCell {
    
    var photo : UIImageView = UIImageView()
    
    var name : UILabel = {
        let label = UILabel()
        UIElementSizes.forLabel(sender: label, size: 16.0)
        label.numberOfLines = 0
        return label
    }()
    
    var descriptions : UILabel = {
        let label = UILabel()
        UIElementSizes.forLabel(sender: label, size: 10.0)
        label.numberOfLines = 0
        return label
    }()
    
    var manufacturer : UILabel = {
        let label = UILabel()
        UIElementSizes.forLabel(sender: label, size: 8.0)
        label.numberOfLines = 0
        return label
    }()
    
    var item: Car?  {
        didSet {
            self.name.text = item?.name
            self.descriptions.text = item?.description
            self.manufacturer.text = item?.manufacturer
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(name)
        addSubview(descriptions)
        addSubview(manufacturer)
        setConstraints()
    }
    
    func setConstraints() {
        name.translatesAutoresizingMaskIntoConstraints = false
        descriptions.translatesAutoresizingMaskIntoConstraints = false
        manufacturer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            descriptions.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            descriptions.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptions.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            manufacturer.topAnchor.constraint(equalTo: descriptions.bottomAnchor, constant: 10),
            manufacturer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            manufacturer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            manufacturer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)

        ])
    }
}
