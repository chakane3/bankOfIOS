//
//  ViewController.swift
//  BankingApplication
//
//  Created by Chakane Shegog on 2/26/22.
//

import UIKit

class SignupView: UIViewController {
    @IBOutlet weak var enterEmailField: UITextField!
    @IBOutlet weak var enterPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
    }
    
    func loadUsers() {
        UserAccounts.getUsers { (result) in
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let data):
                dump(data)
            }
        }
    }
    
    @IBAction func signinButton(_ sender: Any) {
    }
    
    @IBAction func signupButton(_ sender: Any) {
    }
}

