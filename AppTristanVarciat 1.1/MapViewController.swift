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
	
	var monus = [Monu]()
	var annotations = [CustomAnnotation]()
	
	var selectedMonu: Monu?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mapView.delegate = self
		
		// Nous centrons la carte sur la latitude et la longitude passée en paramètre
		let center = CLLocationCoordinate2D(latitude: 45.19193413, longitude: 5.72666532)
		centerMap(onLocation: center)
		
		self.monus = MonuContext.shared.monus
		
		monus.forEach { monu in
			let annotation = CustomAnnotation()
			annotation.id = monu.id
			annotation.coordinate = CLLocationCoordinate2D(latitude: monu.latitude, longitude: monu.longitude)
			annotation.title = monu.title
			annotation.subtitle = monu.subtitle
			annotations.append(annotation)
			
			mapView.addAnnotation(annotation)
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		//Si on a un monument quand la vue apparait, alors on centre sur les coordonnées de celui-ci par exemple
		if let monumentToDisplay = self.selectedMonu {
			let center = CLLocationCoordinate2D(latitude: monumentToDisplay.latitude, longitude: monumentToDisplay.longitude)
			centerMap(onLocation: center, 2000)
			
			let annotationToOpen = self.annotations.first(where: {$0.id == monumentToDisplay.id})
			if annotationToOpen != nil {
				DispatchQueue.main.async {
					//Pour la sélectionner
					self.mapView.selectAnnotation(annotationToOpen!, animated: true)
				}
			}
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		//Quand on quitte la carte, on supprimes le monu pour ne pas revenir dessus à la sélection du tab Map
		self.selectedMonu = nil
	}
	
	func centerMap(onLocation location: CLLocationCoordinate2D, _ meters: CLLocationDistance? = 20000) {
		let region = MKCoordinateRegion.init(center: location, latitudinalMeters: meters!, longitudinalMeters: meters!)
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
			pinView.isUserInteractionEnabled = true
			
			return pinView
		}
		return nil
	}	
	
	func mapView(_ mapView:MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
		if control == view.rightCalloutAccessoryView {
			print(view.annotation?.title)
			
			if let annotation = view.annotation as? CustomAnnotation {
				let detailsViewController = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
				
				if let monu = monus.first(where: { $0.id == annotation.id }) {
					detailsViewController.monu = monu
				}
				
				self.navigationController?.pushViewController(detailsViewController, animated: true)
			}
		}
		
	}
	
//	func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//		let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)
//
//		alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
//		alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//
//		self.present(alert, animated: true)
//	}
}

