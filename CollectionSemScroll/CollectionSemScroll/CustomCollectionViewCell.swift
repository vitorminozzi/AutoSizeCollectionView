//
//  CustomCollectionViewCell.swift
//  CollectionSemScroll
//
//  Created by Vitor Gomes on 18/05/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static public let identifier = "customCollectionViewCell"
    
    var label: UILabel!
    var image: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(text: String, imageString: String) {
        label.text = text
        image.image = UIImage(systemName: imageString)
    }
    
}

extension CustomCollectionViewCell {
    func setupLayout() {
        
        image = UIImageView()
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 24),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        
        label = UILabel()
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


