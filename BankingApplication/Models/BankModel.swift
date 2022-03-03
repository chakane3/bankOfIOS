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

// This is the data we will send to our POST request for account creation
struct PostUser: Encodable {
    let first_name: String
    let last_name: String
    let email: String
    let password: String
    let account_number: Int
    let amount: String
}

// This is the data we will send to our POST request for userAuth
struct CheckUser: Encodable {
    let email: String
    let password: String
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

