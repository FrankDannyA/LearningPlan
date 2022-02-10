//
//  LessonViewController.swift
//  LearningPlan
//
//  Created by Даниил Франк on 08.02.2022.
//

//TODO: Сделать единный массив с данными модели
//TODO: Вынести загрузку локальной модели данных в viewControlle через segue
//TODO: Рефакторинг названий
//TODO: Заглушку для скачивания файла через alert

import UIKit


class LessonViewController: UIViewController {
    
    var tearmModel: ModelTearm?
 
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelForTitleLearningYear: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        labelForTitleLearningYear.text = "ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН НА \(tearmModel?.learningYear)"
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

