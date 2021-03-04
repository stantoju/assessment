//
//  Subject.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation

struct Subject: Decodable {
    
    var id: Int
    var name: String
    var icon: String
    var chapters: [Chapter]
    
}
