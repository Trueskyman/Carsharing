import UIKit
import MapKit
import CoreLocation
import MessageUI
import Foundation
import UserNotifications


class MapViewController1: UIViewController, MFMailComposeViewControllerDelegate, CLLocationManagerDelegate {
    
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
            
            

        // Configure the fields of the interface.
//        composeVC.setToRecipients(["Irochev2@gmail.com"])
//        composeVC.setSubject("Carsharing!")
//        composeVC.setMessageBody("Email; Car driver license PHOTO and nubmer!", isHTML: false)

        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)

    }
    
    
    
    @IBOutlet weak var MAp: MKMapView!
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        
        

        
        // Do any additional setup after loading the view.
        
        let location = CLLocationCoordinate2D(latitude: 58.002918, longitude: 56.223642)
    
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: location, span: span)
        MAp.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Toyota Corolla"
        annotation.subtitle = "Color: Silver Number: M245AP/159"
        
        MAp.addAnnotation(annotation)
        
        
       
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }else{
            
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            MAp.showsUserLocation = true
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
    
}
        extension MapViewController: CLLocationManagerDelegate {
    
            func locationManager(_manager: CLLocationManager, didUpdateLocation location: [CLLocation]){
                //back
            }

            func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            //back
            }
            
}
