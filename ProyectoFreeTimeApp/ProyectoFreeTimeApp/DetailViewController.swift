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
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var event: EventsModel!
    var imageReference: StorageReference {
        return Storage.storage().reference().child("imagenes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
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
        addressLabel.text = event.address
        
    }
    
    @objc func showEvent(){
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let eventsVC = mainStoryboard.instantiateViewController(withIdentifier: "eventsVC")
        let nv = UINavigationController(rootViewController: eventsVC)
        present(nv, animated: true, completion: nil)
        
    }


    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addAction(_ sender: Any) {
        
        let buttonActionSheet = UIAlertController(title: "Free Time App", message: "¿Quieres agregar a la lista este evento?", preferredStyle: .actionSheet)
        
        
        buttonActionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(buttonActionSheet, animated: true, completion: nil)
        
        buttonActionSheet.addAction(UIAlertAction(title: "Agregar", style: .default, handler: { (action) in
            DetailContainer.shared.addItem(item: self.event)
            
            
        }))
    }
    
}
