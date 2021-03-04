//
//  VideoViewmodel.swift
//  challenge
//
//  Created by Toju on 3/3/21.
//


import Foundation
import CoreData

final class VideoViewmodel: ObservableObject {
    
    @Published var loading = true

    let saveLessonsUsecase = SaveLessonsUsecase()
    
    func saveLesson(lesson:Lesson) {
        saveLessonsUsecase.saveLesson(lesson: lesson)
    }
    
    
    
}
