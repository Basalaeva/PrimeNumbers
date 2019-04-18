//
//  CollectionViewCell.swift
//  PrimeNumbers
//
//  Created by Kate on 10/04/2019.
//  Copyright © 2019 Kate. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var cellText: UILabel!
    
    func configure(with text: String) {
        cellText.text = text
    }
}
