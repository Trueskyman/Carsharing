//
//  SignUpViewController.swift
//  Carsharing
//
//  Created by Igor Rochev on 24.04.2020.
//  Copyright © 2020 Igor Rochev. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

        @IBOutlet weak var firstNameTextField: UITextField!
        @IBOutlet weak var lastNameTextField: UITextField!
        @IBOutlet weak var emailNameTextField: UITextField!
        @IBOutlet weak var passwordNameTextField: UITextField!

        @IBOutlet weak var signUpButton:UIButton!
        @IBOutlet weak var errorLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailNameTextField)
        Utilities.styleTextField(passwordNameTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    
    func validateFields() -> String? {
        
//        if  firstNameTextField.text!.trimmingCharacters(in: .whiteblablabla) ||
//            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            emailNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            passwordNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || {
//
//                                    return "Please fill in all fields"
//
//        }
    
    
        let cleanedPassword = passwordNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false{
                                    return "Please make sure your password at least 8 characters, special characters and number!"
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any){
        
        let error = validateFields()
        
        if error != nil{
            showError(error!)
        }
        else{
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password ) { (result, err) in
                if err != nil {
                    
                    self.showError("CORRECT EMAIL ADRESS")
                }
                else{
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid] ) { (error) in
                        
                        if error != nil {
                            
                            self.showError("Error saving user data")
                        }
                    
                    }
                    
                    self.transitionToHome()
                    
                    
                    
                }
                
            }
        }
    }

    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }

    func transitionToHome(){
        
       let homeViewController =  storyboard?.instantiateViewController (identifier: Constants.Storyboard.homeViewController) as? HomeViewController
    
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    
    }
    
    
    
}
