//
//  CardAnimation.swift
//  challenge
//
//  Created by Toju on 3/1/21.
//

import UIKit
import SwiftUI

class CardAnimation: UIView {
    
    
    // MARK: - Properties
    var vector: UIImageView!
    let randInt = [1,2,3]
    var choice: Int!
    
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        choice = randInt.randomElement() ?? 1
        
        switch choice {
        case 1:
            setupTopAnimation()
        case 2:
            setupBottomAnimation()
        default:
            setupRightAnimation()
        }
        
        self.frame = bounds
        
    }
    
    
    // MARK: - Handlers
    fileprivate func setupTopAnimation(){
        vector = generateImage(src: "t1")
        addSubview(vector)
        vector.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor)
    }
    
    fileprivate func setupBottomAnimation(){
        vector = generateImage(src: "b1")
        addSubview(vector)
        vector.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil)
    }
    
    fileprivate func setupRightAnimation(){
        vector = generateImage(src: "r1")
        addSubview(vector)
        vector.anchor(top: nil, leading: nil, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor)
    }
    
    
    func animate(delay: TimeInterval, duration: TimeInterval, distance: CGRect) {
        if choice == 1 {
            vector.animateX(delay: 0, duration: duration, distance: -distance.width + 50)
        }
        else if choice == 2 {
            vector.animateX(delay: 0, duration: duration, distance: distance.width - 50)
        }
        else {
            vector.animateY(delay: 0, duration: duration, distance: -distance.height + 20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}





struct ComponentTop_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            CardAnimation()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
