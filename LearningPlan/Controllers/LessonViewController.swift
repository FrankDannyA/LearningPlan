//
//  LessonViewController.swift
//  LearningPlan
//
//  Created by Даниил Франк on 08.02.2022.
//

import UIKit


class LessonViewController: UIViewController {
    
    var tearmModel: ModelTearm?
    var selectTearm = 0
 
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelForTitleLearningYear: UILabel!

    @IBAction func downloadPDF(_ sender: Any) {
        if tearmModel?.urlForDownLoad == nil || tearmModel?.urlForDownLoad == "" {
            showAletr(title: "Ошибка",
                      message: "В данный момент загрузка невозможна, пожалуйста попробуйте позже" )
        } else {
            downloadPDF()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        labelForTitleLearningYear.text = "ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН НА \(tearmModel?.learningYear ?? "")"
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func showAletr( title: String, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let aletAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(aletAction)
        present(alert, animated: true)
    }
    
    private func downloadPDF(){
        collectionView.reloadData()
        guard let url = URL(string: (tearmModel?.urlForDownLoad)!) else { return }
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }

    private func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{
        (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        
        //Верхние полосы
            let topItemForButton = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)))
            
            let twoButtonImitationGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.6)),subitem: topItemForButton, count: 2)
            
            let topItemForTextDescription = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.4)))
   
        let topGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(1.0),
            heightDimension: .fractionalHeight(0.3)), subitems: [twoButtonImitationGroup, topItemForTextDescription])
        
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
    
    func forImitationDataDownload(type: Int) -> ModelTearm{
        if type == 1{
            let destinationModel = ModelTearm(learningYear: "2022 - 2023 Уч год",
                                              learningTearm: ["5"," 6"],
                                              nameOfDiscipline: ["Электрохимия \n(на англ. яз)",
                                                                 "Иностранный язык С1",
                                                                 "Основы химического анализа"],
                                              academycHoursLectio: [TimeForClasses.electrochemistry_F: 10,
                                                                    TimeForClasses.electrochemistry_P: 30,
                                                                    TimeForClasses.languageC1_F: 30,
                                                                    TimeForClasses.languageC1_P: 30,
                                                                    TimeForClasses.fundamentalsOfChemicalAnalysis_F : 10,
                                                                    TimeForClasses.fundamentalsOfChemicalAnalysis_P : 30],
                                              academycHoursSeminar: [TimeForClasses.electrochemistry_F: 5,
                                                                TimeForClasses.electrochemistry_P: 15,
                                                                TimeForClasses.languageC1_F: 15,
                                                                TimeForClasses.languageC1_P: 15,
                                                                TimeForClasses.fundamentalsOfChemicalAnalysis_F : 0,
                                                                TimeForClasses.fundamentalsOfChemicalAnalysis_P : 0 ],
                                              academycHoursLab: [ TimeForClasses.electrochemistry_F: 10,
                                                             TimeForClasses.electrochemistry_P: 30,
                                                             TimeForClasses.languageC1_F: 10,
                                                             TimeForClasses.languageC1_P: 30,
                                                             TimeForClasses.fundamentalsOfChemicalAnalysis_F : 10,
                                                             TimeForClasses.fundamentalsOfChemicalAnalysis_P : 30
                                              ])
            return destinationModel
        } else{
            //извините - тороплюсь))
            let destinationModel = ModelTearm(learningYear: "2022 - 2023 Уч год",
                                              learningTearm: ["5"," 6"],
                                              nameOfDiscipline: ["Электрохимия \n(на англ. яз)",
                                                                 "Иностранный язык С1",
                                                                 "Основы химического анализа"],
                                              academycHoursLectio: [TimeForClasses.electrochemistry_F: Int.random(in: 1...100),
                                                                    TimeForClasses.electrochemistry_P: Int.random(in: 1...100),
                                                                    TimeForClasses.languageC1_F: Int.random(in: 1...100),
                                                                    TimeForClasses.languageC1_P: Int.random(in: 1...100),
                                                                    TimeForClasses.fundamentalsOfChemicalAnalysis_F : Int.random(in: 1...100),
                                                                    TimeForClasses.fundamentalsOfChemicalAnalysis_P : Int.random(in: 1...100)],
                                              academycHoursSeminar: [TimeForClasses.electrochemistry_F: Int.random(in: 1...100),
                                                                TimeForClasses.electrochemistry_P: Int.random(in: 1...100),
                                                                TimeForClasses.languageC1_F: Int.random(in: 1...100),
                                                                TimeForClasses.languageC1_P: Int.random(in: 1...100),
                                                                TimeForClasses.fundamentalsOfChemicalAnalysis_F : Int.random(in: 1...100),
                                                                TimeForClasses.fundamentalsOfChemicalAnalysis_P : Int.random(in: 1...100) ],
                                              academycHoursLab: [ TimeForClasses.electrochemistry_F: Int.random(in: 1...100),
                                                             TimeForClasses.electrochemistry_P: Int.random(in: 1...100),
                                                             TimeForClasses.languageC1_F: Int.random(in: 1...100),
                                                             TimeForClasses.languageC1_P: Int.random(in: 1...100),
                                                             TimeForClasses.fundamentalsOfChemicalAnalysis_F : Int.random(in: 1...100),
                                                             TimeForClasses.fundamentalsOfChemicalAnalysis_P : Int.random(in: 1...100)
                                                                ])
            return destinationModel
        }
        
    }
    
}

