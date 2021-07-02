//
//  ViewController.swift
//  esoEs
//
//  Created by Frederick Seitz on 7/1/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var micheButton: UIButton!
    
    private lazy var locationManager: CLLocationManager = {
        
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.distanceFilter = kCLDistanceFilterNone
        manager.requestAlwaysAuthorization()
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
    }
    
    @IBAction func addFloodButtonPressed() {
        
        guard let location = self.locationManager.location else {
            return
        }
        
        let annotation = MKPointAnnotation()
        annotation.title = "Miche"
        annotation.subtitle = "Reported on 07/02/2021"
        annotation.coordinate = location.coordinate
        
        self.mapView.addAnnotation(annotation)
        
    }


}

