//
//  bankAPI.swift
//  BankingApplication
//
//  Created by Chakane Shegog on 2/28/22.
//

import Foundation

struct bankAPI {
    
    // create a new user account
    static func createNewUser(postUser: PostUser ,completionHandler: @escaping (Result<Bool, NetworkError>) -> Void) {
        let endpoint = "http://localhost:8080/api/bank/addNewUser"
        var req = URLRequest(url: URL(string:endpoint)!)
        
        // convert PostUser to Data
        do {
            // set the type of  http method we want and the type of data were posting
            let data = try JSONEncoder().encode(postUser)
            req.httpMethod = "POST"
            req.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // proivide data being sent to the api
            req.httpBody = data
            
            // execute the POST request
            NetworkRequest.shared.performDataTask(with: req) { (result) in
                switch result {
                case .failure(let appError):
                    completionHandler(.failure(.networkClientError(appError)))
                    
                case .success:
                    completionHandler(.success(true))
                }
            }
        } catch {
            completionHandler(.failure(.encodingError(error)))
        }
    }
    
    // check if user entered the correct email + password
    static func userAuth(checkUser: CheckUser, completionHandler: @escaping (Result<Bool, NetworkError>) -> Void) {
        let endpoint = "http://localhost:8080/api/bank/signIn"
        var req = URLRequest(url: URL(string: endpoint)!)
        
        // convert CheckUser to data
        do {
            // set the type of  http method we want and the type of data were posting
            let data = try JSONEncoder().encode(checkUser)
            req.httpMethod = "POST"
            req.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // proivide data being sent to the api
            req.httpBody = data
            
            // execute the POST request
            NetworkRequest.shared.performDataTask(with: req) { (result) in
                switch result {
                case .failure(let appError):
                    completionHandler(.failure(.networkClientError(appError)))
                    
                case .success:
                    completionHandler(.success(true))
                }
            }
        } catch {
            completionHandler(.failure(.encodingError(error)))
        }
    }
}
