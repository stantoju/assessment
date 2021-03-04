//
//  SubjectRepository.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import UIKit
import CoreData

class SubjectRepository: SubjectDatasource {
    
    let api = uLessonApi()
    
    func getSubjects(completion: @escaping (Result<SubjectResponse, Error>) -> ()) {
        api.fetchSubjects() { result in
            switch result {
                        case .success(let data):
                            do {
                                let res = try JSONDecoder().decode(SubjectResponse.self, from: data)
                                completion(.success(res))
                            } catch (let err) {
                                completion(.failure(err))
                            }
                        case .failure(let err):
                            completion(.failure(err))
                        }
        }
    }
    
    
    
}
