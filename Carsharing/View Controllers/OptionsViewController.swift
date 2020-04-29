//
//  OptionsViewController.swift
//  Carsharing
//
//  Created by Igor Rochev on 25.04.2020.
//  Copyright © 2020 Igor Rochev. All rights reserved.
//

import UIKit
import MessageUI

class OptionsViewController: UIViewController, MFMailComposeViewControllerDelegate {

        @IBAction func sendFeedbackButtonTapped(_ sender: Any) {
                    
                    let center = UNUserNotificationCenter.current()
                    center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in                     }
                    
                    
                    let content = UNMutableNotificationContent()
                    content.title = "Hey!"
                    content.body = "Want to take car? Do it "
                    
                    let date = Date().addingTimeInterval(20)
                    let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour,. minute, .second], from: date)
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                    
                    let uuidString = UUID().uuidString
                    let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                    
                    center.add(request) { (error) in
                        
                    }
            
                
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
                
                

    //            Configure; the fields of the interface.
            composeVC.setToRecipients(["Irochev2@gmail.com"])
            composeVC.setSubject("Carsharing!")
            composeVC.setMessageBody("Car driver license photo!", isHTML: false)

    //         Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)

        }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [ .alert, .sound])
            { (granted, error) in
            }
            
                
            let content = UNMutableNotificationContent()
            content.title = "Time is out!"
            content.body = "Your car closed! Pay for drive!"
            
            
            let date = Date().addingTimeInterval(25)
            
            let dateComponents =  Calendar.current.dateComponents([ .year, .month, .day, .hour, .minute, .second ], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            
            let uuidString =  UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            // Do any additional setup after loading the view.
        
        
            center.add(request) { (error ) in

        // Do any additional setup after loading the view.
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
}
