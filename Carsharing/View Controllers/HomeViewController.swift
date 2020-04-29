//
//  HomeViewController.swift
//  Carsharing
//
//  Created by Igor Rochev on 24.04.2020.
//  Copyright © 2020 Igor Rochev. All rights reserved.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [ .alert, .sound])
        { (granted, error) in
        }
        
            
        let content = UNMutableNotificationContent()
        content.title = "Hey! What's up!"
        content.body = "Need a car?? Come back!"
        
        
        let date = Date().addingTimeInterval(20)
        
        let dateComponents =  Calendar.current.dateComponents([ .year, .month, .day, .hour, .minute, .second ], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        
        let uuidString =  UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        // Do any additional setup after loading the view.
    
    
        center.add(request) { (error ) in
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
