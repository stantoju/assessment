//
//  GetSubjectUseCase.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation

class GetSubjectUseCase {
    
    let subjectRepo = SubjectRepository()
    
    func getRemote(completion:  @escaping ([Subject]) ->()) {
        subjectRepo.getSubjects { (result) in
            switch result {
                        case .success(let data):
                            let subjects = data.data.subjects
                            completion(subjects)
                        case .failure(let err):
                            print(err.localizedDescription)
                        }
        }
    }
    
    
}
