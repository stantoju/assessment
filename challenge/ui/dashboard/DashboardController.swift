//
//  DashboardController.swift
//  challenge
//
//  Created by Toju on 2/28/21.
//

import UIKit
import SwiftUI

class DashboardController: UICollectionViewController {
    
    // MARK: - Properties
    private let cellId = "cellId"
    private let cellId2 = "cellId2"
    let headerId = "headerId"
    static let composeHeaderId = "composeHeaderId"
    static let composeButtonId = "composeButtonId"
    let background = BgAnimation()
    let viewmodel = DashboardViewmodel()
    var subjects = [Subject]()
    var baseLessons = [Lesson]()
    var lessons = [Lesson]()
    var more = true
    var delegate: CompositionalButtonDelegate?
    
    
    
    
    
    // MARK: - Initializers
    
    init() {
        super.init(collectionViewLayout: DashboardController.setupController())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundView = background
        
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(SubjectCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(LessonCell.self, forCellWithReuseIdentifier: cellId2)
        
        collectionView.register(CompositionalHeader.self, forSupplementaryViewOfKind: DashboardController.composeHeaderId, withReuseIdentifier: headerId)
        
        collectionView.register(CompositionalButton.self, forSupplementaryViewOfKind: DashboardController.composeButtonId, withReuseIdentifier: headerId)
        
        setupNavTitle()
        fetchData()
       
    }
    
    
    
    // MARK: - Handlers
    
    private func fetchData() {
        viewmodel.fetchSubjects(){ result in
            self.subjects = result
            self.collectionView.reloadData()
        }
        
        viewmodel.fetchSavedLessons(){result in
            self.baseLessons = result
            self.lessons = result
        }
    }
    
    static func setupController()-> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(120)))
                item.contentInsets.bottom = 16
                item.contentInsets.trailing = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                return section
                
                
            } else {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                item.contentInsets.bottom = 16

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 16
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: composeHeaderId, alignment: .topLeading)
                
                let button = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: composeButtonId, alignment: .bottomLeading)
                
                section.boundarySupplementaryItems = [header, button]
                
                return section
            }
        }
    }
    
    
    func setupNavTitle() {
        let titleLabel = view.generateLabel(title: "Hello Stan", size: 40)
        let leftItem = UIBarButtonItem(customView: titleLabel)
            self.navigationItem.leftBarButtonItem = leftItem
            navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let controller = SubjectController()
    controller.subject = subjects[indexPath.item]
    self.navigationController?.pushViewController(controller, animated: true)
        } else {
                let controller = VideoController()
            controller.lesson = lessons[indexPath.item]
        self.navigationController?.pushViewController(controller, animated: true)
        }

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return subjects.count
        }
        return lessons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SubjectCell
            cell.subject = subjects[indexPath.item]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! LessonCell
        cell.lesson = lessons[indexPath.item]
        return cell
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension DashboardController: CompositionalButtonDelegate {
    func handleTap() {
        
        print(more)
        if more {
            showLess()
        } else{
            showMore()
        }
        more.toggle()
    }
    
    func showMore() {
        lessons = baseLessons
        collectionView.reloadData()
    }
    
    func showLess(){
        if baseLessons.count >= 3 {
            lessons = Array(baseLessons[0 ..< 3])
        } else {
            lessons = baseLessons
        }
        collectionView.reloadData()
    }
    
    
}





struct DashboardController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: DashboardController())
            
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
        
        typealias UIViewControllerType = UIViewController
        
        
    }
}
