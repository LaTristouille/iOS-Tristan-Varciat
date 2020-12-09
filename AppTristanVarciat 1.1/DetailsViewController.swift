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
    @IBAction func goToSecond(_ sender: Any) {
        tabBarController?.selectedIndex = 1
       
    }
    
    var image = UIImage()
    var name = ""
    var details = ""
    var longitude = 0.0
    var latitude = 0.0
    
    private var nextViewNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleDetails.text = "\(name)"
        imgDetails.image = image
        lblDetails.text = "\(details)"

        // Do any additional setup after loading the view.
    }
    
}
