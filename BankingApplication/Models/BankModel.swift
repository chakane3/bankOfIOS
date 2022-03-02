//
//  BankModel.swift
//  BankingApplication
//
//  Created by Chakane Shegog on 2/28/22.
//

import Foundation



// This is the data we will GET from our request
struct UserAccounts: Codable {
    let first_name: String
    let last_name: String
    let email: String
    let password: String
    let account_number: Int
    let id: Int
    let amount: String
}

// This is the data we will send to our POST request
struct PostUser: Encodable {
    let first_name: String
    let last_name: String
    let email: String
    let password: String
    let account_number: Int
    let amount: String
}

extension UserAccounts {
    static func getUsers(completionHandler: @escaping (Result<[UserAccounts], NetworkError>) -> ()) {
        let endpoint = "http://localhost:8080/api/bank/users"
        let req = URLRequest(url: URL(string:endpoint)!)
        NetworkRequest.shared.performDataTask(with: req) { (result) in
            switch result {
            case .failure(let networkError):
                completionHandler(.failure(networkError))
                
            case .success(let data):
                do {
                    let userData = try JSONDecoder().decode([UserAccounts].self, from: data)
                    completionHandler(.success(userData))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}

extension PostUser {
    func createNewUser(_ postUser: PostUser ,completionHandler: @escaping (Result<Bool, NetworkError>) -> Void) {
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
}
