//
//  MapViewController.swift
//  Carsharing
//
//  Created by Igor Rochev on 22.04.2020.
//  Copyright © 2020 Igor Rochev. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import MessageUI
import Foundation
import UserNotifications


class MapViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet var MAp: MKMapView!
    
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





