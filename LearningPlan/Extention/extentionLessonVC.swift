//
//  extentionLessonVC.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//

import UIKit

extension LessonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 18 } //18
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
            cell.configure(text: "Электрохимия \n(на англ. яз)",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .left)
        case 4:
            cell.textInCellStackView.isHidden = false
            cell.configure(text: "Иностранный язык С1",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .left)
        case 5:
            cell.textInCellStackView.isHidden = false
            cell.configure(text: "Основы химического анализа",
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
            cell.configure(text: "10/30",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
        case 8:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "30/30",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
        case 9:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "10/30",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
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
            cell.configure(text: "5/15",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
        case 12:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "15/15",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
        case 13:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
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
            cell.configure(text: "10/30",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
        case 16:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "10/30",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
        case 17:
            cell.textInCellStackView.isHidden = false
            cell.backgroundColor = .white
            cell.configure(text: "10/30",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
        default:
            cell.backgroundColor = .black
        }
        return cell
    }
}
