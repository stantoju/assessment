//
//  BgAnimation.swift
//  challenge
//
//  Created by Toju on 3/1/21.
//

import UIKit
import SwiftUI

class BgAnimation: UIView {
    
    
    // MARK: - Properties
    var vector1: UIImageView!
    var vector2: UIImageView!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "bg")
        
        setupView()
        
    }
    
    func setupView() {
        
        vector1 = generateImage(src: "hand")
        vector2 = generateImage(src: "semicircle")
        addSubviews(vector1, vector2)
        
        vector1.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil)
        vector2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 250).isActive = true
        vector2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        vector1.animateY(delay: 0, duration: 30, distance: -bounds.height + 200)
        vector2.animateX(delay: 0, duration: 50, distance: -200)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



struct BgAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            BgAnimation()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
