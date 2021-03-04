//
//  DashboardViewmodel.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation
import CoreData

final class DashboardViewmodel: ObservableObject {
    
    let getSubjectUsecase = GetSubjectUseCase()
    let getSavedLessonsUsecase = GetSavedLessonsUsecase()
    
    func fetchSubjects(completion: @escaping ([Subject])->()) {
        
        getSubjectUsecase.getRemote { subjects in
            completion(subjects)
        }
    }
    
    func fetchSavedLessons(completion: @escaping ([Lesson]) -> ()) {
        
        getSavedLessonsUsecase.getLessons(){result in
            completion(result)
        }
        
    }
    
    
}
