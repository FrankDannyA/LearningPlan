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
        collectionView.collectionViewLayout = createLayout()
        }
    
    func createLayout() -> UICollectionViewLayout{
        //возможно подкорректировать .fractional
        let itemSizeForTitles = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(0.2))
        let groupSizeForTitles = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:
                                                    .fractionalWidth(0.6))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSizeForTitles)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSizeForTitles, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        //section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

//MARK: -  UICollectionViewDelegate, UICollectionViewDataSource
extension LessonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 6 } //18
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    cell.backgroundColor = .black //.secondarySystemBackground
    cell.layer.borderColor = CGColor(red: 0.95,
                                     green: 0.95,
                                     blue: 0.97,
                                     alpha: 1.0) //.secondarySystemBackground
    cell.layer.borderWidth = 1
    
    
    return cell
    }
    
    
}
