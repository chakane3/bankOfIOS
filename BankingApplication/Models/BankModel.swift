//
//  BankModel.swift
//  BankingApplication
//
//  Created by Chakane Shegog on 2/28/22.
//

import Foundation



struct UserAccounts: Codable {
    let first_name: String
    let last_name: String
    let email: String
    let password: String
    let account_number: Int
    let id: Int
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
