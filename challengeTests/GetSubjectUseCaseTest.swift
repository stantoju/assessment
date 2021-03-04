//
//  GetSubjectUseCaseTest.swift
//  challengeTests
//
//  Created by Toju on 3/4/21.
//

import XCTest
@testable import challenge

class GetSubjectUseCaseTesT: XCTestCase {
    
    var fakeRepository: FakeSubjectRepository?
    var subjectResponse: SubjectResponse?
    var error: Error?
    var getSubjectUseCase: FakeGetSubjectUseCase?
    
    override func setUp(){
        super.setUp()
        fakeRepository = FakeSubjectRepository()
        fakeRepository?.getSubjects(){ res in
            switch res {
                        case .success(let data):
                            self.subjectResponse = data
                        case .failure(let err):
                            self.error = err
                        }
        }
        getSubjectUseCase = FakeGetSubjectUseCase()
    }
    
    override func tearDown(){
        fakeRepository = nil
        subjectResponse = nil
        getSubjectUseCase = nil
        super.tearDown()
    }
    
    func test_get_subjects_return_structure() throws {
        var subjects = [Subject]()
        getSubjectUseCase?.getRemote(){ res in
            subjects = res
        }
        
        XCTAssertTrue(subjects.count > 0)
        XCTAssertNotNil(subjects[0].chapters)
        XCTAssertNotNil(subjects[0].chapters[0].lessons[0])
        
    }

    
    

}



class FakeSubjectRepository: SubjectDatasource {
    
    var lessons: [Lesson]
    var chapters: [Chapter]
    var subjects: [Subject]
    var subjectData: SubjectData
    var response: SubjectResponse
    init() {
         lessons = [Lesson(id:1, name:"", icon:"",media_url:"",subject_id:1, chapter_id: 1)]
         chapters = [Chapter(id:1, name:"", lessons:lessons)]
         subjects = [Subject(id:1, name: "", icon:"", chapters:chapters)]
         subjectData = SubjectData(status: "", message:"", subjects: subjects)
        response = SubjectResponse(data:subjectData)
    }
    
    func getSubjects(completion: @escaping (Result<SubjectResponse, Error>) -> ()) {
        completion(.success(response))
    }
    
    
}

class FakeGetSubjectUseCase {
    
    let subjectRepo = FakeSubjectRepository()
    
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
