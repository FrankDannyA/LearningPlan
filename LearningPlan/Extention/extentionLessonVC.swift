//
//  extentionLessonVC.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//

import UIKit

extension LessonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 18 } //18
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.layer.borderColor = CGColor(red: 0.783922, green: 0.780392, blue: 0.8, alpha: 1.0)
        cell.layer.borderWidth = CGFloat(0.3)
        cell.termStackView.isHidden = true
        cell.textInCellStackView.isHidden = true
        
        switch indexPath.row{
        case 0:
            cell.termStackView.isHidden = false
        case 1:
            cell.termStackView.isHidden = true
            cell.textInCellStackView.isHidden = false
            cell.configure(text: "Аудиторные занятия в часах",
                           size: 12.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .right)
        case 2:
            cell.termStackView.isHidden = true
            cell.textInCellStackView.isHidden = false
            cell.configure(text: "Наименование дисциплины",
                           size: 15.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .left)
        case 3:
            cell.textInCellStackView.isHidden = false
            cell.configure(text: lectioTearm[0].nameOfTheDiscipline.rawValue,
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .left)
        case 4:
            cell.textInCellStackView.isHidden = false
            cell.configure(text: lectioTearm[1].nameOfTheDiscipline.rawValue,
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .left)
        case 5:
            cell.textInCellStackView.isHidden = false
            cell.configure(text: lectioTearm[2].nameOfTheDiscipline.rawValue,
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .left)
        case 6:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "Лекция",
                           size: 15.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .center)
        case 7:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: lectioTearm[0].academycHours[TimeForClasses.electrochemistry_F] ?? 0,
                                       p: lectioTearm[0].academycHours[TimeForClasses.electrochemistry_P] ?? 0)
        case 8:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: lectioTearm[1].academycHours[TimeForClasses.languageC1_F] ?? 0,
                                       p: lectioTearm[1].academycHours[TimeForClasses.languageC1_P] ?? 0)
        case 9:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: lectioTearm[2].academycHours[TimeForClasses.fundamentalsOfChemicalAnalysis_F] ?? 0,
                                       p: lectioTearm[2].academycHours[TimeForClasses.fundamentalsOfChemicalAnalysis_P] ?? 0)
        case 10:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "Семинар",
                           size: 15.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .center)
        case 11:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: seminarTearm[0].academycHours[TimeForClasses.electrochemistry_F] ?? 0,
                                       p: seminarTearm[0].academycHours[TimeForClasses.electrochemistry_P] ?? 0)
        case 12:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: seminarTearm[1].academycHours[TimeForClasses.languageC1_F] ?? 0,
                                       p: seminarTearm[1].academycHours[TimeForClasses.languageC1_P] ?? 0)
        case 13:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: seminarTearm[2].academycHours[TimeForClasses.fundamentalsOfChemicalAnalysis_F] ?? 0,
                                       p: seminarTearm[2].academycHours[TimeForClasses.fundamentalsOfChemicalAnalysis_P] ?? 0)
        case 14:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "Лабарат.",
                           size: 15.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .center)
        case 15:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: labTearm[0].academycHours[TimeForClasses.electrochemistry_F] ?? 0,
                                       p: labTearm[0].academycHours[TimeForClasses.electrochemistry_P] ?? 0)
        case 16:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: labTearm[1].academycHours[TimeForClasses.languageC1_F] ?? 0,
                                       p: labTearm[1].academycHours[TimeForClasses.languageC1_P] ?? 0)
        case 17:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: labTearm[2].academycHours[TimeForClasses.fundamentalsOfChemicalAnalysis_F] ?? 0,
                                       p: labTearm[2].academycHours[TimeForClasses.fundamentalsOfChemicalAnalysis_P] ?? 0)
        default:
            cell.backgroundColor = .black
        }
        return cell
    }
}
