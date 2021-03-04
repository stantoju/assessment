//
//  GetSavedLessons.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//


import Foundation
import CoreData

class GetSavedLessonsUsecase {
    
    let lessonRepo = LessonRepository()
    
    func getLessons(completion:  @escaping ([Lesson]) ->()) {
        lessonRepo.getSavedLessons { result in
            let data = result as! [LessonEntity]
            completion(self.lessonRepo.convertToLessonBulk(data: data))
        }
    }
    
    
}
