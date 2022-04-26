//
//  WordCell.swift
//  4picture1word
//
//  Created by User on 4/24/22.
//

import UIKit

class WordCell: UICollectionViewCell {
    lazy var letterLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        backgroundColor = .lightGray
        
        addSubview(letterLabel)
        
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        letterLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
//        letterLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        letterLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
}
