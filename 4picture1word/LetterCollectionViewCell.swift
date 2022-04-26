//
//  LetterCollectionViewCell.swift
//  4picture1word
//
//  Created by User on 4/18/22.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell {
    
    private lazy var letter: UILabel = {
        let view = UILabel()
        view.text = "A"
        return view
    }()
    
    
    override func addSubview(_ view: UIView) {
        addSubview(letter)
        
    }
    
}
