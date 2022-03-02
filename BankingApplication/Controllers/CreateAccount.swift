//
//  CreateAccount.swift
//  BankingApplication
//
//  Created by Chakane Shegog on 2/28/22.
//

import UIKit

class CreateAccount: UIViewController {
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBOutlet weak var errorMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func checkIfPasswordIsSame() {
        if passwordField.text != confirmPasswordField.text {
            errorMsg.text = "passwords do not match"
        }
    }
    
    @IBAction func createAccountBtn(_ sender: Any) {
        checkIfPasswordIsSame()
        
        // create a new user object based on whats in the text fields
        let newUser = PostUser(first_name: firstNameField.text ?? "",
                               last_name: self.lastNameField.text ?? "",
                               email: self.emailField.text ?? "",
                               password: self.passwordField.text ?? "",
                               account_number: generateAccountNumber(),
                               amount: "0.00")
        dump(newUser)
        

    }
    
    func generateAccountNumber() -> Int {
        return Int.random(in: 10000000...99999999)
    }
    
}
