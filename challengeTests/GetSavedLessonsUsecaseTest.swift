//
//  GetSavedLessonsUsecaseTest.swift
//  challengeTests
//
//  Created by Toju on 3/4/21.
//

import XCTest
import CoreData
@testable import challenge

class GetSavedLessonsUsecaseTest: XCTestCase {
    
    var fakeLessonRepository: FakeLessonRepository?
    
    override func setUp(){
        super.setUp()
        
        fakeLessonRepository = FakeLessonRepository()
        
    }
    
    override func tearDown(){
        fakeLessonRepository = nil
        super.tearDown()
    }
    
    func test_repository_saveLesson() throws {
        let lessonsCount = fakeLessonRepository?.lessons.count
        fakeLessonRepository?.saveLesson(lesson: fakeLessonRepository!.lesson1)
        
        XCTAssertTrue(fakeLessonRepository?.lessons.count == lessonsCount! + 1)
    }

    func test_repository_convertToLesson_return_LessonType() throws {
        let data = NSManagedObject()
        let lesson = fakeLessonRepository?.convertToLesson(obj: data)
        XCTAssertNotNil(lesson)
    }
    
    func test_repository_convertToLessonBulk_return_LessonArray() throws {
        let data = [NSManagedObject]()
        let lessons = fakeLessonRepository?.convertToLessonBulk(data: data)
        
        XCTAssertNotNil(lessons)
        XCTAssertNotNil(lessons?[0])
        
    }
    

}


class FakeLessonRepository: LessonDataSource {
    let lesson1 = Lesson(id: 1, name: "Lesson 1", icon: "", media_url: "", subject_id: 1, chapter_id: 1)
    let lesson2 = Lesson(id: 1, name: "Lesson 2", icon: "", media_url: "", subject_id: 2, chapter_id: 2)
    var lessons = [Lesson(id: 3, name: "Lesson 3", icon: "", media_url: "", subject_id: 1, chapter_id: 1),
                   Lesson(id: 4, name: "Lesson 4", icon: "", media_url: "", subject_id: 2, chapter_id: 2)]
    func getSavedLessons(completion: @escaping ([Any]) -> ()) {
        completion(lessons)
    }
    
    func saveLesson(lesson: Lesson) {
        lessons.append(lesson)
    }
    
    func deleteLesson(indexSet: IndexSet) {
    }
    
    func convertToLesson(obj: NSManagedObject) -> Lesson {
        return lesson1
    }
    
    func convertToLessonBulk(data: [NSManagedObject]) -> [Lesson] {
        return lessons
    }
    
    
}




