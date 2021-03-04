//
//  LessonDataSource.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//

import Foundation
import CoreData


protocol LessonDataSource {
    
    func getSavedLessons(completion: @escaping ([Any])->())
    func saveLesson(lesson: Lesson)
    func deleteLesson(indexSet: IndexSet)
    func convertToLesson(obj: NSManagedObject) -> Lesson
    func convertToLessonBulk(data: [NSManagedObject]) -> [Lesson]
    
    
}
