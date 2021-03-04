//
//  Lesson.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation


struct Lesson: Decodable {
    
    var id: Int
    var name: String
    var icon: String
    var media_url: String
    var subject_id: Int
    var chapter_id: Int
    
}


