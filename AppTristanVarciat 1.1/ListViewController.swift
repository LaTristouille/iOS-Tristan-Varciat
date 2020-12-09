//
//  ListViewController.swift
//  AppTristanVarciat 1.1
//
//  Created by Tristan Varciat on 27/11/2020.
//  Copyright © 2020 Tristan Varciat. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet var maTableView: UITableView!
    
    var monus = [Monu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		MonuContext.shared.initializeMonu()
		monus = MonuContext.shared.monus
		
        maTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

    //ulet model = MapViewController.sharedInstance
    //var named = model.annotation.title
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return monus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let monu = monus[indexPath.row]
        cell.nameLabel.text = monu.name
        cell.photoImageView.image = monu.photo
        
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
        let monu = monus[indexPath.row]
		vc?.monu = monu
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
