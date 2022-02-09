//
//  LessonViewController.swift
//  LearningPlan
//
//  Created by Даниил Франк on 08.02.2022.
//

import UIKit

class LessonViewController: UIViewController {
    
    let learningPlan = LearningPlan(learningYear: "2021-2022")
    
    var lectioTearm: [Tearm] = []
    var seminarTearm: [Tearm] = []
    var labTearm: [Tearm] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelForTitleLearningYear: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        tearmInit()
        
        labelForTitleLearningYear.text = "ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН НА \(learningPlan.learningYear) УЧ. ГОД"
    }
    
    
    private func tearmInit(){
     
        
        let lectioElctrochemistry = Tearm(nameOfTheDiscipline: Classes.electrochemistry,
                      academycHours: [TimeForClasses.electrochemistry_F: 10,
                                      TimeForClasses.electrochemistry_P: 30])
        let lectioLanguageC1 = Tearm(nameOfTheDiscipline: Classes.languageC1,
                                    academycHours: [TimeForClasses.languageC1_F: 30,
                                                    TimeForClasses.languageC1_P: 30])
        let lectioFundamentalsOfChemicalAnalysis = Tearm(nameOfTheDiscipline: Classes.fundamentalsOfChemicalAnalysis,
                                                           academycHours: [TimeForClasses.fundamentalsOfChemicalAnalysis_F : 10,
                                                                           TimeForClasses.fundamentalsOfChemicalAnalysis_P : 30])
        lectioTearm.append(lectioElctrochemistry)
        lectioTearm.append(lectioLanguageC1)
        lectioTearm.append(lectioFundamentalsOfChemicalAnalysis)
        
        let seminarElctrochemistry = Tearm(nameOfTheDiscipline: Classes.electrochemistry,
                            academycHours: [TimeForClasses.electrochemistry_F: 5,
                                            TimeForClasses.electrochemistry_P: 15])
        let seminarLanguageC1 = Tearm(nameOfTheDiscipline: Classes.languageC1,
                                      academycHours: [TimeForClasses.languageC1_F: 15,
                                                      TimeForClasses.languageC1_P: 15])
        let seminarFundamentalsOfChemicalAnalysis = Tearm(nameOfTheDiscipline: Classes.fundamentalsOfChemicalAnalysis,
                                                          academycHours: [TimeForClasses.fundamentalsOfChemicalAnalysis_F : 0,
                                                                          TimeForClasses.fundamentalsOfChemicalAnalysis_P : 0])
        seminarTearm.append(seminarElctrochemistry)
        seminarTearm.append(seminarLanguageC1)
        seminarTearm.append(seminarFundamentalsOfChemicalAnalysis)
        
        
        let labElctrochemistry = Tearm(nameOfTheDiscipline: Classes.electrochemistry,
                                       academycHours: [TimeForClasses.electrochemistry_F: 10,
                                                       TimeForClasses.electrochemistry_P: 30])
        let labLanguageC1 = Tearm(nameOfTheDiscipline: Classes.languageC1,
                                  academycHours: [TimeForClasses.languageC1_F: 10,
                                                  TimeForClasses.languageC1_P: 30])
        let labFundamentalsOfChemicalAnalysis = Tearm(nameOfTheDiscipline: Classes.fundamentalsOfChemicalAnalysis,
                                                      academycHours: [TimeForClasses.fundamentalsOfChemicalAnalysis_F : 10,
                                                                      TimeForClasses.fundamentalsOfChemicalAnalysis_P : 30])
        labTearm.append(labElctrochemistry)
        labTearm.append(labLanguageC1)
        labTearm.append(labFundamentalsOfChemicalAnalysis)
    }
    
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
    }

    private func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{
        (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        
        //Верхние полосы
        let topItemForButton = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.6)))
        
        let topItemForTextDescription = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.4)))
        
        let topGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(1.0),
            heightDimension: .fractionalHeight(0.3)), subitems: [topItemForButton, topItemForTextDescription])
        
        //Нижняя первая группа с названиями
        let firstItemForNaming = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.20)))
        
        let firstItemWidthNaming = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.33)))
        
        let firstGroupWidhNaming = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.80)), subitem: firstItemWidthNaming, count: 3)
        
        let firstNamesGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .fractionalHeight(1.0)), subitems: [firstItemForNaming, firstGroupWidhNaming])
        
        //Нижняя вторая группа с лекциями
        let secondItemForLecture = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.20)))
        
        let secondItemWithLecture = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.33)))
        
        let secondGroupWithLecture = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.80)), subitem: secondItemWithLecture, count: 3)
        
        let secondLecturesGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.24),
            heightDimension: .fractionalHeight(1.0)), subitems: [secondItemForLecture, secondGroupWithLecture])
        
        let groupWithContent = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.6),
            heightDimension: .fractionalHeight(1.0)), subitem: secondLecturesGroup, count: 3)
        
        let bottomGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(1.0),
            heightDimension: .fractionalHeight(0.7)), subitems: [firstNamesGroup, groupWithContent])
            bottomGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(self.collectionView.frame.width),
            heightDimension: .fractionalWidth(1.0)), subitems: [topGroup, bottomGroup])
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
        return section
    }
    return layout
}
    
}

