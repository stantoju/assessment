//
//  SubjectData.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation


struct SubjectData: Decodable {
    
    var status: String
    var message: String
    var subjects: [Subject]
    
}
