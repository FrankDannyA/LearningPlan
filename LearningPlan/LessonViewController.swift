//
//  LessonViewController.swift
//  LearningPlan
//
//  Created by Даниил Франк on 08.02.2022.
//

import UIKit

class LessonViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.isScrollEnabled = false
        collectionView.collectionViewLayout = createLayoutFinal()
        //collectionView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        
        
        
        }
    
    func createLayout() -> UICollectionViewLayout {
           let layout = UICollectionViewCompositionalLayout {
               (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
               
               //Элемент справа
               let trailingItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.3)))
               //Отступ
               //trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
               
               //Элементы слева
               let leadingItem = NSCollectionLayoutItem(
                   layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.3)))
               //Отступ
              // leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
               
               //группировка слева
               let leadingGroup = NSCollectionLayoutGroup.vertical(
                   layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                                      heightDimension: .fractionalHeight(1.0)),
                   subitem: leadingItem, count: 4)
               
               //группировка справа
               let trailingGroup = NSCollectionLayoutGroup.vertical(
                layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                                  heightDimension: .fractionalHeight(1.0)) ,
                subitem: trailingItem, count: 12)
               
               //элемент вверху
               let topItem = NSCollectionLayoutItem(
                   layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(0.3)))
               //topItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
               
               let topNestedGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(0.4)),
                subitem: topItem, count: 2)
               
               //группировка большого блока внизу
               let bottomNestedGroup = NSCollectionLayoutGroup.horizontal(
                   layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.6)),
                   subitems: [ leadingGroup,  trailingGroup])


               let nestedGroup = NSCollectionLayoutGroup.vertical(
                   layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.4)),
                   subitems: [topNestedGroup, bottomNestedGroup])
               
               
               let section = NSCollectionLayoutSection(group: nestedGroup)
               
               return section

           }
        
        
           return layout
       }
    
    
    
}
    
func createLayoutFinal() -> UICollectionViewLayout{
    
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
            widthDimension: .fractionalWidth(1.0),
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
            widthDimension: .fractionalWidth(0.27),
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
            widthDimension: .fractionalWidth(0.73),
            heightDimension: .fractionalHeight(1.0)), subitem: secondLecturesGroup, count: 3)
        

        
        
        let bottomGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.7)), subitems: [firstNamesGroup, groupWithContent])
        //bottomGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
        
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(1.0),
            heightDimension: .fractionalWidth(1.0)), subitems: [topGroup, bottomGroup])
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
        return section
    }
    
  
    
    return layout
}

//MARK: -  UICollectionViewDelegate, UICollectionViewDataSource
extension LessonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 18 } //18

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    cell.backgroundColor = .black //.secondarySystemBackground
    cell.layer.borderColor = CGColor(red: 0.95,
                                     green: 0.95,
                                     blue: 0.97,
                                     alpha: 1.0) //.secondarySystemBackground
    cell.layer.borderWidth = CGFloat(0.3)

    return cell
    }
    
    


}
