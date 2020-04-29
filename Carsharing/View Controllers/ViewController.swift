//
//  ViewController.swift
//  Carsharing
//
//  Created by Igor Rochev on 22.04.2020.
//  Copyright © 2020 Igor Rochev. All rights reserved.
//

import UIKit


class ViewController: UIViewController{

        
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
        
        override func viewDidLoad() {
        super.viewDidLoad()

            setUpElements()
            
            
        
    
}
    
    func setUpElements(){
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }

    
}
