//
//  ScenarioVM.swift
//  ExpertApp
//
//  Created by Sachindra Fernando on 2022-11-01.
//

import SwiftUI
import Foundation

class ScenarioVM: ObservableObject{
    typealias Completionhandeler = ( _ status: Bool,  _ code: Int, _ message: String) -> ()
    
    @Published var scenarios: [Scenario] = []
 
    func getScenariosList(completion: @escaping Completionhandeler) {
        URLSession.shared.request(url: URL(string: "http://mobileapi.efserver.net/mobile_api_test/scenarios"),
                                  expecting: [Scenario].self) { result in
                        switch result {
                            
                        case .success(let payload):
                            
                            DispatchQueue.main.async {
                                
                                self.scenarios = payload
                                print(self.scenarios)
                            }
                            
                            completion(true, 200, "Success")
                            
                        case .failure(let error):
                            
                            completion(false, 400, error.localizedDescription)
                            
                        }
                    }
    }
}

extension URLSession {
    
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            
            guard let url = url else {
                completion(.failure(CustomError.invalidUrl))
                return
            }
            
            let task = dataTask(with: url) { data, _, error in
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(CustomError.invalidData))
                    }
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(expecting, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
            
        }
}



