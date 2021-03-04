//
//  SubjectDataSource.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation


protocol SubjectDatasource {
    
    func getSubjects(completion: @escaping (Result<SubjectResponse, Error>) -> ())
    

    
}
