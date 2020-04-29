//
//  SignViewController.swift
//  Carsharing
//
//  Created by Igor Rochev on 23.04.2020.
//  Copyright © 2020 Igor Rochev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class SignViewController: UIViewController {


    
//    var signup:Bool = true{
//        willSet{
//            if newValue{
//                titleLabel.text =  "Registry"
//                nameField.isHidden = false
//                enterButton.setTitle("Sign Up", for: .normal)
//            }else{
//                titleLabel.text = "Sign"
//                nameField.isHidden = true
//                enterButton.setTitle("Registry", for: .normal)
//            }
//        }
//    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    

//    func validateFields() -> String? {
//
//        if nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//
//            {
//
//                return "Please fill in all Fields"
//
//        }
//
//        return nil
//
//    }
    

    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        nameField.delegate = self
//        emailField.delegate = self
//        passwordField.delegate = self
//
//    }
//    @IBAction func switchButton(_ sender: UIButton) {
//        signup = !signup
//    }
//
//    func showAlert(){
//        let alert = UIAlertController(title: "Error", message: "Add info in all Fields", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        present(alert,animated: true, completion: nil)
//    }
//
//}

//    extension SignViewController: UITextFieldDelegate{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
//        let name = nameField.text!
//        let email = emailField.text!
//        let password = passwordField.text!
////   info adress
//        if(signup){
//            if(!name.isEmpty && !email.isEmpty && !password.isEmpty){
//                Auth.auth().createUser(withEmail: "email", password: "password") { (result, error) in
//                        if error != nil {
//
//                            self.showAlert()
//
//                    }
//                }
//            }else{
//                let db = Firestore.firestore()
//
//            }
//            }else{
//                if(!email.isEmpty && !password.isEmpty){
//
//            }else{
//                showAlert()
//            }
//        }
        
//        return true
        
        }
            




