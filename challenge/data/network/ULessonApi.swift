//
//  ULessonApi.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation

class uLessonApi {
    
    let http = Http()
    
    func fetchSubjects(completion: @escaping (Result<Data, Error>) -> ()) {
        let url = "content/grade"
        http.getRequest(url: url) { result in
            switch result {
                        case .success(let data):
                            completion(.success(data))
                        case .failure(let err):
                            completion(.failure(err))
            }
        }
    }
    
    
}
