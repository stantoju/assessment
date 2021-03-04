//
//  LessonRepository.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//

import Foundation
import CoreData
import UIKit

class LessonRepository: LessonDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getSavedLessons(completion: @escaping ([Any])->()) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "LessonEntity")
        do {
            let results = try! context.fetch(request)
            completion(results)
        }
    }
    
    func saveLesson(lesson: Lesson) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "LessonEntity", into: self.context)
        entity.setValue(lesson.id, forKey: "id")
        entity.setValue(lesson.icon, forKey: "icon")
        entity.setValue(lesson.media_url, forKey: "media_url")
        entity.setValue(lesson.name, forKey: "name")
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteLesson(indexSet: IndexSet) {
        for index in indexSet {
            do {
                getSavedLessons { result in
                    
                    var data: [LessonEntity] = result as! [LessonEntity]
                let obj = data[index]
                    self.context.delete(obj)
                    try! self.context.save()
                let index = data.firstIndex(of: obj)
                data.remove(at: index!)
                
                }
                
            }
        }
    }
    
    func convertToLesson(obj: NSManagedObject) -> Lesson {
        let lesson = Lesson(
            id: (obj.value(forKey: "id") as! Int),
            name: obj.value(forKey: "name") as! String,
            icon: obj.value(forKey: "icon") as! String,
            media_url: obj.value(forKey: "media_url") as! String,
            subject_id: 1,
            chapter_id: 1
        )
        return lesson
    }
    
    func convertToLessonBulk(data: [NSManagedObject]) -> [Lesson] {
        var result = [Lesson]()
        for item in data {
            result.append(convertToLesson(obj: item))
        }
        return result
    }
    
}
