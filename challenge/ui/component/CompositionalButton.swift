//
//  CompositionalButton.swift
//  challenge
//
//  Created by Toju on 3/1/21.
//

import UIKit
import SwiftUI

protocol CompositionalButtonDelegate {
    func handleTap()
}


class CompositionalButton: UICollectionReusableView {
    
    var delegate: CompositionalButtonDelegate?
    var button: UIButton!
    var shape1: UIImageView!
    var shape2: UIImageView!
    var shape3: UIImageView!
    var shape4: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        button = generateButton(title: "VIEW ALL", bgcolor: UIColor(named: "orange"), txtColor: UIColor.white)
        addSubview(button)
        button.fillSuperview()
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        
        shape1 = generateImage(src: "shape1")
        shape2 = generateImage(src: "shape2")
        shape3 = generateImage(src: "shape3")
        shape4 = generateImage(src: "shape4")
        button.addSubviews(shape1,shape2,shape3, shape4)
        
        shape1.centerInSuperview()
        shape2.centerInSuperview()
        shape3.centerInSuperview()
        shape4.centerInSuperview()
        
        
    }
    
    override func layoutSubviews() {
        shape4.animateX(delay: 0.0, duration: 5, distance: 100)
        shape3.animateX(delay: 0.2, duration: 4, distance: 100)
        shape2.animateX(delay: 0.3, duration: 2, distance: 80)
        shape1.animateX(delay: 0.5, duration: 3, distance: 50)
    }
    
    
    @objc func handleTap() {
        print("tapping")
        delegate?.handleTap()
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct CompositionalButton_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            CompositionalButton()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
