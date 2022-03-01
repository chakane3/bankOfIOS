//
//  BankingApplicationTests.swift
//  BankingApplicationTests
//
//  Created by Chakane Shegog on 2/26/22.
//

import XCTest
@testable import BankingApplication

class BankingApplicationTests: XCTestCase {
    func testGetUsers() {
        let endpoint = "http://localhost:8080/api/bank/users"
        let request = URLRequest(url: URL(string: endpoint)!)
        NetworkRequest.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let err):
                XCTFail("error occured: \(err)")
                
            case .success(let data):
                XCTAssertGreaterThan(data.count, 100, "Data should be bigger than 100B")
            }
        }
    }

}
