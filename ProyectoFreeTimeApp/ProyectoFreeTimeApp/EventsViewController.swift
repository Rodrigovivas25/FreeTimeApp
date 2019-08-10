//
//  EventsViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Rodrigo Vivas on 7/25/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var eventsRef: DatabaseReference!
    
    var imageReference: StorageReference {
        return Storage.storage().reference().child("imagenes")
    }
    
    var eventsList = [EventsModel]()
    var imagesList = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 160
        
        eventsRef = Database.database().reference().child("eventos")
        eventsRef.observe(DataEventType.value) { (snapshot) in
            if snapshot.childrenCount > 0{
                self.eventsList.removeAll()
                for events in snapshot.children.allObjects as! [DataSnapshot]{
                    let eventObject = events.value as? [String:AnyObject]
                    
                    let event = EventsModel(name: eventObject?["Nombre"] as? String ?? "", beginDate: eventObject?["FechaInicio"] as? String ?? "", endDate: eventObject?["FechaFin"] as? String ?? "", beginHour: eventObject?["HoraInicio"] as? String ?? "", endHour: eventObject?["HoraFin"] as? String ?? "", imageName: "\(String(describing: eventObject?["Imagen"] as? String ?? "")).jpg", latitud: eventObject?["Latitud"] as? Double ?? 0.0, longitud: eventObject?["Longitud"] as? Double ?? 0.0, category: eventObject?["Categoria"] as? String ?? "", price: eventObject?["Precio"] as? Double ?? 0.0)
                    
                    self.eventsList.append(event) 
                }
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    @objc func showEvent(){
        //Se crea la referencia del storyboard
        let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        let detailVC = detailStoryboard.instantiateViewController(withIdentifier: "detailVC")
        //Se crea un navigation controller
        let nv = UINavigationController(rootViewController: detailVC)
        //Se presenta el navigation controller
        present(nv, animated: true, completion: nil)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventsTableViewCell
        let event: EventsModel
        event = eventsList[indexPath.row]
        
        let downloadImageRef = imageReference.child(event.imageName)
        
        downloadImageRef.getData(maxSize: 1024*1024*12) { (data, error) in
            /*if let data = data{
                let picture = UIImage(data: data)
                self.imagesList.append(picture!)
            }*/
            //print(error ?? "No error")
            //cell.eventImage.image = UIImage(data: data!)
            if error != nil{
                print("cargando")
            }
            else{
                cell.eventImage.image = UIImage(data: data!)
            }
        }
        /*
        downloadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "Terminó")
        }
        
        downloadTask.resume()*/
        
        cell.nameLabel.text = event.name
        cell.beginDate.text = event.beginDate
        cell.endDate.text = event.endDate
        cell.beginHour.text = event.beginHour
        cell.endHour.text = event.endHour
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC")
        let nv = UINavigationController(rootViewController: detailVC)
        present(nv, animated: true, completion: nil)
        
    }
    
    @IBAction func showFilter(_ sender: Any) {
        let shoppingSB = UIStoryboard(name: "FilterStoryboard", bundle: nil)
        let shoppingVC = shoppingSB.instantiateViewController(withIdentifier: "filterVC")
        shoppingVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        let navigation = UINavigationController(rootViewController: shoppingVC)
        present(navigation, animated: true, completion: nil)
    }
    
}

