//
//  LocationsViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Ricardo Hernández González on 8/10/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation

class LocationsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        
        for places in DetailContainer.shared.showEvent(){
            var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
            coordinate.latitude = places.latitud
            coordinate.longitude = places.longitud
            
            let annotation: MKPointAnnotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = places.address
            mapView.addAnnotation(annotation)
            
        }
        
    }
    
    @IBAction func foundmeButton() {
        initLocation()
    }
    
    func initLocation() {
        
        let authorization = CLLocationManager.authorizationStatus()
        if authorization == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if authorization == .denied {
            alertLocation(tit: "Error de localización", men: "Actualmente tiene denegada la localización del dispositivo.")
        } else if authorization == .restricted {
            alertLocation(tit: "Error de localización", men: "Actualmente tiene restringida la localización del dispositivo.")
        } else {
            
            guard let currentCoordinate = locationManager.location?.coordinate else { return }
            
            
            let region = MKCoordinateRegion(center: currentCoordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func alertLocation(tit: String, men: String) {

        let alert = UIAlertController(title: tit, message: men, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else {return}
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newLocation.coordinate
        mapView.addAnnotation(annotation)
    }*/
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.pinTintColor = .orange
        return pin
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

