//
//  Http.swift
//  challenge
//
//  Created by Toju on 3/2/21.
//

import Foundation

class Http {
    
    let baseUrl = "https://jackiechanbruteforce.ulesson.com/3p/api/"
    
    //Singleton
    static let instance = Http()
    
    
    func getRequest(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: "\(baseUrl)\(url)") else { fatalError("Invalid URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                completion(.success(data!))
                
            }
        }.resume()
    }
    
    
}
