//
//  SubjectCell.swift
//  challenge
//
//  Created by Toju on 3/1/21.
//

import UIKit
import SwiftUI
import Kingfisher

class SubjectCell: UICollectionViewCell {
    
    var title: UILabel!
    var icon: UIImageView!
    var vectorAnimation = CardAnimation()
    let bgs = [UIColor(named: "yellow"),UIColor(named: "green"),UIColor(named: "blue"),UIColor(named: "orange")]
    var bgColor: UIColor?
    
    var subject: Subject?{
        didSet{
            let url = URL(string: subject?.icon ?? "")
            title.text = subject?.name
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
        
        title = generateLabel(title: "Subject", size: 15)
        title.textColor = .white
        icon = generateSystemImage(src: "paperclip")
        addSubviews(vectorAnimation, icon, title)
        
        icon.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 15, left: 15, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        icon.contentMode = .scaleAspectFit
        title.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 15, right: 15))
        vectorAnimation.frame = bounds
        
        backgroundColor = bgs.randomElement()!!
        
    }
    
    override func layoutSubviews() {
        vectorAnimation.animate(delay: 0, duration: 15, distance: bounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


struct SubjectCell_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            SubjectCell()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
