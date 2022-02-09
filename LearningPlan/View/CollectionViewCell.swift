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
    
    @IBOutlet weak var buttonForTerm5: UIButton!
    @IBOutlet weak var buttonForTerm6: UIButton!
    
    @IBAction func pressTerm5() {
        
    }
    @IBAction func pressTerm6() {
    }
    
    @IBOutlet weak var labelForTextInCell: UILabel!
    
    
    
    func configure(text: String, size: CGFloat, textColor: UIColor, textAlignment: NSTextAlignment){
        labelForTextInCell.text = text
        labelForTextInCell.font = UIFont(name: "Helvetica neue", size: size)
        labelForTextInCell.textAlignment = textAlignment
        labelForTextInCell.textColor = textColor
    }
    
    
    func resultInStringAtColor(f value1: Int, p value2: Int) {
        let value1AtString = String(value1)
        let value2AtString = String(value2)
        if value1 == 0 && value2 == 0 {
            labelForTextInCell.text = ""
        } else if value1 < value2 {
            let string = NSMutableAttributedString(string: "\(value1AtString) / \(value2AtString)")
            string.setColor(color: UIColor.red, forText: value2AtString)
            string.setColor(color: UIColor.green, forText: value1AtString)
            labelForTextInCell.attributedText = string
        } else if value1 >= value2{
            let string = NSMutableAttributedString(string: "\(value1AtString) / \(value2AtString)")
            string.setColor(color: UIColor.green, forText: "\(value1AtString) / \(value2AtString)")
            string.setColor(color: UIColor.black, forText: "/")
            labelForTextInCell.attributedText = string
        }
    }
}
