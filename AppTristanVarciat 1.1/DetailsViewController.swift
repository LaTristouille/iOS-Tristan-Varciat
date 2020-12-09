//
//  DetailsViewController.swift
//  AppTristanVarciat 1.1
//
//  Created by Tristan Varciat on 07/12/2020.
//  Copyright © 2020 Tristan Varciat. All rights reserved.
//

import UIKit


class DetailsViewController: UIViewController {

    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
	
	// C'est mieux de passer l'objet directement
	var monu: Monu?
    
    private var nextViewNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleDetails.text = monu?.name
        imgDetails.image = monu?.photo!
        lblDetails.text = monu?.details
    }
    
	@IBAction func goToSecond(_ sender: Any) {
		if let mapViewController = tabBarController?.viewControllers?[1] as? MapViewController {
			mapViewController.selectedMonu = self.monu
		}
		
		tabBarController?.selectedIndex = 1
	   
	}
}
