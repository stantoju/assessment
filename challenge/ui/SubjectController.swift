//
//  SubjectController.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//

import UIKit
import SwiftUI

class SubjectController: UICollectionViewController {
    
    // MARK: - Properties
    private let cellId = "cellId"
    let headerId = "headerId"
    static let composeHeaderId = "composeHeaderId"
    let background = BgAnimation()
    var subject: Subject? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    
    init() {
        super.init(collectionViewLayout: SubjectController.setupController())
    }
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundView = background
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(ChapterCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(CompositionalHeader.self, forSupplementaryViewOfKind: DashboardController.composeHeaderId, withReuseIdentifier: headerId)
        
        collectionView.register(CompositionalButton.self, forSupplementaryViewOfKind: DashboardController.composeButtonId, withReuseIdentifier: headerId)
        
        setupNavTitle()
    }
    
    
    
    // MARK: - Handlers
    
    static func setupController()-> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(195), heightDimension: .absolute(195)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: composeHeaderId, alignment: .topLeading)
                
                section.boundarySupplementaryItems = [header]
                
                return section
                
            
        }
    }
    
    
    func setupNavTitle() {
        let backButton = view.generateImageButton(image: "back")
        backButton.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        let leftItem = UIBarButtonItem(customView: backButton)
            self.navigationItem.leftBarButtonItem = leftItem
            navigationController?.navigationBar.prefersLargeTitles = true
        
        let titleLabel = view.generateLabel(title: subject?.name ?? "", size: 40)
        navigationItem.titleView = titleLabel
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! CompositionalHeader
        header.label.text = subject?.chapters[indexPath.item].name
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = VideoController()
        controller.lesson = subject?.chapters[indexPath.section].lessons[indexPath.item]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        subject?.chapters.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        subject?.chapters[section].lessons.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChapterCell
        cell.lesson = subject?.chapters[indexPath.section].lessons[indexPath.item]
        return cell
    }
    

    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    

}





struct SubjectController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: SubjectController())
            
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
        
        typealias UIViewControllerType = UIViewController
        
        
    }
}
