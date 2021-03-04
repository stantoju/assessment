//
//  SaveLesson.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//

import Foundation

class SaveLessonsUsecase {
    
    let lessonRepo = LessonRepository()
    
    func saveLesson(lesson: Lesson) {
        lessonRepo.saveLesson(lesson: lesson)
    }
    
    
}
