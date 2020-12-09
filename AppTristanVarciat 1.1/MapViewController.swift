//
//  MapViewController.swift
//  Demo
//
//  Created by Julie Saby on 09/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    static let sharedInstance = MapViewController()
    let annotation = CustomAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        // Nous centrons la carte sur la latitude et la longitude passée en paramètre
        let center = CLLocationCoordinate2D(latitude: 45.19193413, longitude: 5.72666532)
        centerMap(onLocation: center)
        
        
        // Nous créons une annotation customisée
        let annotation = CustomAnnotation()
        annotation.id = "id-1"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 45.194999, longitude: 5.732365)
        annotation.title = "Musée de Grenoble"
        annotation.subtitle = "Photo"
        
        mapView.addAnnotation(annotation)
        
        let annotation2 = CustomAnnotation()
        annotation2.id = "id-2"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 45.199194, longitude: 5.724629)
        annotation2.title = "La Bastille"
        annotation2.subtitle = "Photo"
        
        mapView.addAnnotation(annotation2)
        
        let annotation3 = CustomAnnotation()
        annotation3.id = "id-3"
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 45.075537, longitude: 5.773050)
        annotation3.title = "Domaine de Vizille"
        
        mapView.addAnnotation(annotation3)
        
        let annotation4 = CustomAnnotation()
        annotation4.id = "id-4"
        annotation4.coordinate = CLLocationCoordinate2D(latitude: 45.207801, longitude: 5.657654)
        annotation4.title = "Grotte les Cuves de Sassenage"
        annotation4.subtitle = "Photo"
        
        mapView.addAnnotation(annotation4)
        
        let annotation5 = CustomAnnotation()
        annotation5.id = "id-5"
        annotation5.coordinate = CLLocationCoordinate2D(latitude: 44.960671, longitude: 5.742942)
        annotation5.title = "La Mine Image"
        annotation5.subtitle = "Photo"
        
        mapView.addAnnotation(annotation5)
        
        let annotation6 = CustomAnnotation()
        annotation6.id = "id-6"
        annotation6.coordinate = CLLocationCoordinate2D(latitude: 45.233026, longitude: 5.885831)
        annotation6.title = "Maison Bergès"
        annotation6.subtitle = "Photo"
        
        mapView.addAnnotation(annotation6)
        
        let annotation7 = CustomAnnotation()
        annotation7.id = "id-7"
        annotation7.coordinate = CLLocationCoordinate2D(latitude: 45.141305, longitude: 5.829698)
        annotation7.title = "Parc Thermale d'Uriages"
        annotation7.subtitle = "Photo"
        
        mapView.addAnnotation(annotation7)
    }
    
   func centerMap(onLocation location: CLLocationCoordinate2D) {
          let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 20000, longitudinalMeters: 20000)
          mapView.setRegion(region,animated: true)
      }

    //MARK: -- Annotations --
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is CustomAnnotation {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: String(annotation.hash))

            let rightButton = UIButton(type: .infoLight)
            rightButton.tag = annotation.hash

            pinView.animatesDrop = true
            pinView.canShowCallout = true
            pinView.rightCalloutAccessoryView = rightButton

            return pinView
            
        } else {
            return nil
        }
    }
    
    /*func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }*/
}

