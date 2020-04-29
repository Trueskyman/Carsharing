//
//  File.swift
//  Carsharing
//
//  Created by Igor Rochev on 23.04.2020.
//  Copyright © 2020 Igor Rochev. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    static func showBasicAlert(on vc: UIViewController, with title: String, message: String){
        let alert = UIAlertController(title: "Car is open", message: "Status $5/h", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
        present(alert, animated: true)
    }
}
