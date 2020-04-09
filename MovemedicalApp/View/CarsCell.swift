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
    
    var item: Car? {
        didSet {
            guard let item = item else {
                return
            }
            self.name.text = item.name
            self.descriptions.text = item.description
            self.manufacturer.text = "Manufactured by: \(item.manufacturer ?? "")"
            
            if let imageName = item.imageName {
                self.photo.image = UIImage(named: imageName)
            }
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
        addSubview(photo)
        addSubview(name)
        addSubview(descriptions)
        addSubview(manufacturer)
        setConstraints()
    }
    
    func setConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        descriptions.translatesAutoresizingMaskIntoConstraints = false
        manufacturer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.widthAnchor.constraint(equalToConstant: 100),
            photo.heightAnchor.constraint(equalToConstant: 100),
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            
            descriptions.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            descriptions.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            descriptions.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            manufacturer.topAnchor.constraint(equalTo: descriptions.bottomAnchor, constant: 10),
            manufacturer.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            manufacturer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            manufacturer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)

        ])
    }
}
