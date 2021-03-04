//
//  LessonCell.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//

import UIKit
import SwiftUI
import Kingfisher

class LessonCell: UICollectionViewCell {
    
    // MARK: - Properties
    var icon: UIImageView!
    var play: UIImageView!
    var subject: UILabel!
    var topic: UILabel!
    let colors = [UIColor(named: "yellow"),UIColor(named: "green"),UIColor(named: "blue"),UIColor(named: "orange")]
    
    var lesson: Lesson?{
        didSet{
            topic.text = lesson?.name
            subject.text = lesson?.name
            let url = URL(string: lesson?.icon ?? "")
            icon.kf.setImage(with: url)
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    
    func setupView() {
        icon = generateSystemImage(src: "book.circle")
        
        icon.layer.cornerRadius = 20;
        icon.layer.masksToBounds = true
        
        play = generateImage(src: "play")
        subject = generateLabel(title: "Subject", size: 12)
        subject.textColor = colors.randomElement()!!
        topic = generateLabel(title: "Topic", size: 18)
        
        addSubviews(icon,subject,topic)
        icon.addSubview(play)
        
        icon.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil,size: .init(width: 150, height: .zero))
        play.centerInSuperview(size: .init(width: 50, height: 50))
        
        subject.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 1).isActive = true
        subject.anchor(top: nil, leading: icon.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 50, left: 20, bottom: 0, right: 0))
        topic.anchor(top: subject.bottomAnchor, leading: icon.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 20, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


struct LessonCell_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            LessonCell()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
