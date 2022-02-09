//
//  CollectionViewCell.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var termStackView: UIStackView!
    @IBOutlet weak var textInCellStackView: UIStackView!
    
    @IBOutlet weak var labelForText: UILabel!
    
    
    func configure(text: String, size: CGFloat, textColor: UIColor, textAlignment: NSTextAlignment){
        labelForText.text = text
        labelForText.font = UIFont(name: "Helvetica neue", size: size)
        labelForText.textAlignment = textAlignment
        labelForText.textColor = textColor
    }
    
    
    
    
    
    
    
    
}
