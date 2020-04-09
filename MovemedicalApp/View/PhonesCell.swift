//
//  PhonesCell.swift
//  MovemedicalApp
//
//  Created by Prasad Patil on 4/9/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

class PhonesCell: UITableViewCell {
    
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
    
    var brand : UILabel = {
        let label = UILabel()
        UIElementSizes.forLabel(sender: label, size: 8.0)
        label.numberOfLines = 0
        return label
    }()

    var first_Released : UILabel = {
        let label = UILabel()
        UIElementSizes.forLabel(sender: label, size: 8.0)
        return label
    }()
    
    var item: Phone?  {
        didSet {
            self.name.text = item?.name
            self.descriptions.text = item?.description
            self.brand.text = "Brand: \(item?.brand ?? "")"
            self.first_Released.text = "Release Date: \(item?.first_Released ?? "")"
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
        addSubview(brand)
        addSubview(first_Released)
        setConstraints()
    }
    
    func setConstraints() {
        name.translatesAutoresizingMaskIntoConstraints = false
        descriptions.translatesAutoresizingMaskIntoConstraints = false
        brand.translatesAutoresizingMaskIntoConstraints = false
        first_Released.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptions.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            descriptions.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptions.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            brand.topAnchor.constraint(equalTo: descriptions.bottomAnchor, constant: 10),
            brand.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            brand.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            brand.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            first_Released.topAnchor.constraint(equalTo: descriptions.bottomAnchor, constant: 10),
            first_Released.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            first_Released.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)

        ])
    }
}
