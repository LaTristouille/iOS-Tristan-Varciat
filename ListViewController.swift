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
        loadSampleMonus()
        maTableView.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

    //ulet model = MapViewController.sharedInstance
    //var named = model.annotation.title
    
    private func loadSampleMonus() {
        
        let photo1 = UIImage(named: "Bastille")
        let photo2 = UIImage(named: "Cuves")
        let photo3 = UIImage(named: "Domaine")
        let photo4 = UIImage(named: "MuseeG")
        let photo5 = UIImage(named:"Mine")
        let photo6 = UIImage(named:"Berges")
        let photo7 = UIImage(named:"Uriages")
        
        
        guard let monu1 = Monu(name: "Fort de la Bastille", photo: photo1, details: "Le fort de la Bastille accessible par les célèbres « bulles » est « LE » site touristique de l’Isère à ne pas manquer : espaces fortifiés, musée des Troupes de Montagne, Centre d’Art contemporain, Acrobastille, Restaurants, panoramas à couper le souffle.", longitude: 5.724629, latitude: 45.199194) else {
            fatalError("Unable to instantiate monu1")
        }
        
        guard let monu2 = Monu(name: "Cuves de Sassenages", photo: photo2, details: "Découvrez un patrimoine hydrogéologique millénaire ! Classée parmi les sept merveilles du Dauphiné dès la fin du Moyen-âge, la grotte les Cuves a très tôt attiré les curieux de la région, inspirant de nombreuses croyances populaires et légendes...", longitude: 5.657654, latitude: 45.207801) else {
            fatalError("Unable to instantiate monu2")
        }
        
        guard let monu3 = Monu(name: "Domaine de Vizille", photo: photo3, details: "Aux portes de Grenoble et du massif de l'Oisans, sur la Route Napoléon, le Domaine de Vizille-Musée de la Révolution française réunit sur un même site, un patrimoine culturel prestigieux et un cadre naturel propice à la détente.", longitude: 5.773050, latitude: 45.075537) else {
            fatalError("Unable to instantiate monu3")
        }
        
        guard let monu4 = Monu(name: "Musee de Grenoble", photo: photo4, details:"Considéré, pour ses collections d’art ancien ou d’art du XXe siècle, comme un des plus prestigieux d’Europe, le musée parcourt l’histoire de la peinture occidentale du XIIIème siècle à nos jours et compte pour chaque période, des œuvres majeures.", longitude: 5.732365, latitude: 45.194999) else {
            fatalError("Unable to instantiate monu4")
        }
        
        guard let monu5 = Monu(name: "La Mine Image", photo: photo5, details: "Ce site minier souterrain propose un cheminement à l’intérieur de galeries authentiques aménagées et une exposition retraçant plus de 1 000 ans d’exploitation du charbon sur le plateau matheysin. Musée associatif.", longitude:  5.742942, latitude: 44.960671) else {
                   fatalError("Unable to instantiate monu5")
               }
        
        guard let monu6 = Monu(name: "Maison Bergès", photo: photo6, details: "Ce musée est installé dans la belle et singulière maison de l’ingénieur innovateur Aristide Bergès (1833-1904). La présentation est axée sur ce personnage, ses défis techniques et de l’hydroélectricité et le développement de son usine de papeterie.", longitude:5.885831, latitude: 45.233026) else {
                          fatalError("Unable to instantiate monu6")
                      }
        
        guard let monu7 = Monu(name: "Parc Thermale d'Uriages", photo: photo7, details:"Élément central de la station thermale autour de laquelle se sont bâtis villas, hôtels et chalets, le parc, aménagé sous Napoléon III (1852-1870), constitue l'occasion d'une flânerie agréable entre arbres variés, kiosque à musique et carrousel.", longitude: 5.829698, latitude: 45.141305) else {
                                 fatalError("Unable to instantiate monu7")
                             }
        
        monus += [monu1, monu4, monu2, monu3, monu5, monu6, monu7]
    }
    
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
        vc?.image = monu.photo!
        vc?.name = monu.name
        vc?.details = monu.details
        vc?.longitude = monu.longitude
        vc?.latitude = monu.latitude
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
