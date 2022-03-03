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
    
    // should segue based on outcome of userAuth
    // if user does not exist, we should show an alert
    // if the user does exist we should segue into the users account view
    @IBAction func signInBtn(_ sender: Any) {
        // use api endpoint to check if email and password exists in our DB
        
        // create a credential object based on what the user entered
        let emailAndPswd = CheckUser(email: enterEmail.text ?? "",
                                     password: enterPassword.text ?? "")
        
        bankAPI.userAuth(checkUser: emailAndPswd) { (result) in
            switch result {
            case .failure(let appError):
                print("either the user entered the wrong credentials or appError occured: \(appError)")
                
                
            case .success:
                
                // check the response
                print("login successful")
            }
        }
    }
}
