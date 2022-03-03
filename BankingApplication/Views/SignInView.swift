//
//  SignInView.swift
//  BankingApplication
//
//  Created by Chakane Shegog on 3/2/22.
//

import UIKit

class SignInView: UIViewController {
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func signInBtn(_ sender: Any) {
        // use api endpoint to check if email and password exists in our DB
    }
}
