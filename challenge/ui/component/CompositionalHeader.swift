//
//  CompositionalHeader.swift
//  challenge
//
//  Created by Toju on 3/1/21.
//

import UIKit

class CompositionalHeader: UICollectionReusableView {
   
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = generateLabel(title: "Recently watched topics", size: 18)
        addSubview(label)
        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

