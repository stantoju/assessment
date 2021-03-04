//
//  Chapter.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation

struct Chapter: Decodable {
    
    var id: Int
    var name: String
    var lessons: [Lesson]
    
}
