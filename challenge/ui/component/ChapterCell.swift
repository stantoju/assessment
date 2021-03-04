//
//  ChapterCell.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//

import UIKit
import SwiftUI
import Kingfisher

class ChapterCell: UICollectionViewCell {
    
    var title: UILabel!
    var icon: UIImageView!
    
    var lesson: Lesson? {
        didSet {
            title.text = lesson?.name
            let url = URL(string: lesson?.icon ?? "")
            icon.kf.setImage(with: url)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 20;
        layer.masksToBounds = true
        setupView()
    }
    
    func setupView()  {
        
        title = generateLabel(title: "Living and Non-Living Things", size: 16)
        title.numberOfLines = 0
        title.textAlignment = .center
        icon = generateSystemImage(src: "book.circle")
        addSubviews(icon, title)

        icon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        icon.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: 20), size: .init(width: .zero, height: 120))

        title.anchor(top: icon.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 15))

        backgroundColor = .white
        
//        frame = bounds
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}



struct ChapterCell_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            ChapterCell()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
