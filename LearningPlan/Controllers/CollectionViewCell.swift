//
//  CollectionViewCell.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//
//TODO: Сделать настройку интерфейса для кнопок и закраску бара сверху
//TODO: Методы отображения данных по нажатию на кнопку

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    let mainScreen = LessonViewController()
    
    @IBOutlet weak var termStackView: UIStackView!
    @IBOutlet weak var textInCellStackView: UIStackView!
    @IBOutlet weak var labelForTextInCell: UILabel!
    
    @IBAction func semestr5(_ sender: UIButton) {
        
        let lectioElctrochemistry = Tearm(nameOfTheDiscipline: Classes.electrochemistry,
                      academycHours: [TimeForClasses.electrochemistry_F: 10,
                                      TimeForClasses.electrochemistry_P: 30])
        let lectioLanguageC1 = Tearm(nameOfTheDiscipline: Classes.languageC1,
                                    academycHours: [TimeForClasses.languageC1_F: 30,
                                                    TimeForClasses.languageC1_P: 30])
        let lectioFundamentalsOfChemicalAnalysis = Tearm(nameOfTheDiscipline: Classes.fundamentalsOfChemicalAnalysis,
                                                           academycHours: [TimeForClasses.fundamentalsOfChemicalAnalysis_F : 10,
                                                                           TimeForClasses.fundamentalsOfChemicalAnalysis_P : 30])
        mainScreen.lectioTearm.append(lectioElctrochemistry)
        mainScreen.lectioTearm.append(lectioLanguageC1)
        mainScreen.lectioTearm.append(lectioFundamentalsOfChemicalAnalysis)
        
        let seminarElctrochemistry = Tearm(nameOfTheDiscipline: Classes.electrochemistry,
                            academycHours: [TimeForClasses.electrochemistry_F: 5,
                                            TimeForClasses.electrochemistry_P: 15])
        let seminarLanguageC1 = Tearm(nameOfTheDiscipline: Classes.languageC1,
                                      academycHours: [TimeForClasses.languageC1_F: 15,
                                                      TimeForClasses.languageC1_P: 15])
        let seminarFundamentalsOfChemicalAnalysis = Tearm(nameOfTheDiscipline: Classes.fundamentalsOfChemicalAnalysis,
                                                          academycHours: [TimeForClasses.fundamentalsOfChemicalAnalysis_F : 0,
                                                                          TimeForClasses.fundamentalsOfChemicalAnalysis_P : 0])
        mainScreen.seminarTearm.append(seminarElctrochemistry)
        mainScreen.seminarTearm.append(seminarLanguageC1)
        mainScreen.seminarTearm.append(seminarFundamentalsOfChemicalAnalysis)
        
        let labElctrochemistry = Tearm(nameOfTheDiscipline: Classes.electrochemistry,
                                       academycHours: [TimeForClasses.electrochemistry_F: 10,
                                                       TimeForClasses.electrochemistry_P: 30])
        let labLanguageC1 = Tearm(nameOfTheDiscipline: Classes.languageC1,
                                  academycHours: [TimeForClasses.languageC1_F: 10,
                                                  TimeForClasses.languageC1_P: 30])
        let labFundamentalsOfChemicalAnalysis = Tearm(nameOfTheDiscipline: Classes.fundamentalsOfChemicalAnalysis,
                                                      academycHours: [TimeForClasses.fundamentalsOfChemicalAnalysis_F : 10,
                                                                      TimeForClasses.fundamentalsOfChemicalAnalysis_P : 30])
        mainScreen.labTearm.append(labElctrochemistry)
        mainScreen.labTearm.append(labLanguageC1)
        mainScreen.labTearm.append(labFundamentalsOfChemicalAnalysis)
    }
    
    @IBAction func semestr6(_ sender: UIButton) {
 
    }
  
    
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
