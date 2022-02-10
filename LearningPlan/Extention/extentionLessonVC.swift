//
//  extentionLessonVC.swift
//  LearningPlan
//
//  Created by Даниил Франк on 09.02.2022.
//

import UIKit

extension LessonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 19 } //19
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.layer.borderColor = CGColor(red: 0.783922, green: 0.780392, blue: 0.8, alpha: 1.0)
        cell.layer.borderWidth = CGFloat(0.3)
        
        switch indexPath.row{
        case 0:
            if selectTearm == 0 {
                cell.layer.borderWidth = CGFloat(1.0)
                cell.layer.borderColor = CGColor(red: 255 / 255, green: 165 / 255, blue: 4 / 255, alpha: 1.0)
                cell.configure(text: "Семестр " + "\(tearmModel?.learningTearm[0] ?? "5")" ,
                               size: 17.0,
                               textColor: .black,
                               textAlignment: .center)
            } else {
                cell.configure(text: "Семестр " + "\(tearmModel?.learningTearm[0] ?? "5")" ,
                               size: 17.0,
                               textColor: .opaqueSeparator,
                               textAlignment: .center)
            }
            cell.backgroundColor = .secondarySystemBackground
            
        case 1:
            if selectTearm == 1 {
                cell.layer.borderWidth = CGFloat(1.0)
                cell.layer.borderColor = CGColor(red: 255 / 255, green: 165 / 255, blue: 4 / 255, alpha: 1.0)
                cell.configure(text: "Семестр " + "\(tearmModel?.learningTearm[1] ?? "6")" ,
                               size: 17.0,
                               textColor: .black,
                               textAlignment: .center)
            } else {
                cell.configure(text: "Семестр " + "\(tearmModel?.learningTearm[1] ?? "6")" ,
                               size: 17.0,
                               textColor: .opaqueSeparator,
                               textAlignment: .center)
            }
            cell.backgroundColor = .secondarySystemBackground
        case 2:
            cell.backgroundColor = .secondarySystemBackground
            cell.configure(text: "Аудиторные занятия в часах",
                           size: 12.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .right)
        case 3:
            cell.backgroundColor = .secondarySystemBackground
            cell.configure(text: "Наименование дисциплины",
                           size: 15.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .left)
        case 4:
            cell.backgroundColor = .secondarySystemBackground
            cell.configure(text: tearmModel?.nameOfDiscipline[0] ?? "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .left)
        case 5:
            cell.backgroundColor = .secondarySystemBackground
            cell.configure(text: tearmModel?.nameOfDiscipline[1] ?? "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .left)
        case 6:
            cell.backgroundColor = .secondarySystemBackground
            cell.configure(text: tearmModel?.nameOfDiscipline[2] ?? "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .left)
        case 7:
            cell.backgroundColor = .white
            cell.configure(text: "Лекция",
                           size: 15.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .center)
        case 8:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursLectio[TimeForClasses.electrochemistry_F] ?? 0,
                                       p: tearmModel?.academycHoursLectio[TimeForClasses.electrochemistry_P] ?? 0)
        case 9:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursLectio[TimeForClasses.languageC1_F] ?? 0,
                                       p: tearmModel?.academycHoursLectio[TimeForClasses.languageC1_P] ?? 0)
        case 10:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursLectio[TimeForClasses.fundamentalsOfChemicalAnalysis_F] ?? 0,
                                       p: tearmModel?.academycHoursLectio[TimeForClasses.fundamentalsOfChemicalAnalysis_P] ?? 0)
        case 11:
            cell.backgroundColor = .white
            cell.configure(text: "Семинар",
                           size: 15.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .center)
        case 12:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursSeminar[TimeForClasses.electrochemistry_F] ?? 0,
                                       p: tearmModel?.academycHoursSeminar[TimeForClasses.electrochemistry_P] ?? 0)
        case 13:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursSeminar[TimeForClasses.languageC1_F] ?? 0,
                                       p: tearmModel?.academycHoursSeminar[TimeForClasses.languageC1_P] ?? 0)
        case 14:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursSeminar[TimeForClasses.fundamentalsOfChemicalAnalysis_F] ?? 0,
                                       p: tearmModel?.academycHoursSeminar[TimeForClasses.fundamentalsOfChemicalAnalysis_P] ?? 0)
        case 15:
            cell.backgroundColor = .white
            cell.configure(text: "Лабарат.",
                           size: 15.0,
                           textColor: .opaqueSeparator,
                           textAlignment: .center)
        case 16:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursLab[TimeForClasses.electrochemistry_F] ?? 0,
                                       p: tearmModel?.academycHoursLab[TimeForClasses.electrochemistry_P] ?? 0)
        case 17:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursLab[TimeForClasses.languageC1_F] ?? 0,
                                       p: tearmModel?.academycHoursLab[TimeForClasses.languageC1_P] ?? 0)
        case 18:
            cell.backgroundColor = .white
            cell.configure(text: "",
                           size: 15.0,
                           textColor: .black,
                           textAlignment: .center)
            cell.resultInStringAtColor(f: tearmModel?.academycHoursLab[TimeForClasses.fundamentalsOfChemicalAnalysis_F] ?? 0,
                                       p: tearmModel?.academycHoursLab[TimeForClasses.fundamentalsOfChemicalAnalysis_P] ?? 0)
        default:
            cell.backgroundColor = .black
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            selectTearm = 0
            tearmModel = forImitationDataDownload(type: 1)
            collectionView.reloadData()
            print("Обновил данные")
        } else if indexPath.row == 1 {
            selectTearm = 1
            tearmModel = forImitationDataDownload(type: 2)
            collectionView.reloadData()
            
        }
    }
}


