//
//  DetailViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Noemí Rodríguez Sandoval D3 on 8/2/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var beginDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var beginHourLabel: UILabel!
    @IBOutlet weak var endHourLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var event: EventsModel!
    var imageReference: StorageReference {
        return Storage.storage().reference().child("imagenes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Información del evento"
        
        let downloadImageRef = imageReference.child(event.imageName)
        
        downloadImageRef.getData(maxSize: 1024*1024*12) { (data, error) in
            if error != nil{
                print("cargando")
            }
            else{
                self.eventImage.image = UIImage(data: data!)
            }
        }
        
        nameLabel.text = event.name
        beginDateLabel.text = event.beginDate
        endDateLabel.text = event.endDate
        beginHourLabel.text = event.beginHour
        endHourLabel.text = event.endHour
        categoryLabel.text = event.category
        priceLabel.text = "$\(event.price)"
    }
<<<<<<< HEAD

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
=======
    
>>>>>>> 796d2ca6af64c520478ab7e096eaed24478dbe19
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

