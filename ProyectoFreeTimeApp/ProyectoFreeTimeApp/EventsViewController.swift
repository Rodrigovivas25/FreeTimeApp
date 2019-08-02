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
                    let eventName = eventObject?["Nombre"]
                    let eventDate = eventObject?["Fecha"]
                    let eventBegin = eventObject?["HoraInicio"]
                    let eventEnd = eventObject?["HoraFin"]
                    let eventImage = eventObject?["Imagen"]
                    
                    let event = EventsModel(name: eventName as! String, date: eventDate as! String, beginHour: eventBegin as! String, endHour: eventEnd as! String, imageName: "\(eventImage as! String).jpg")
                    
                    self.eventsList.append(event)
                }
                self.tableView.reloadData()
            }
        }
        
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    /*func getImage(imageName: String) -> UIImage{
        var picture: UIImage!
        let downloadImageRef = imageReference.child(imageName)
        
        let downloadTask = downloadImageRef.getData(maxSize: 1024*1024*12) { (data, error) in
            if let data = data{
                picture = UIImage(data: data)
                
            }
            print(error ?? "No error")
        }
        
        downloadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "Terminó")
        }
        
        downloadTask.resume()
        
        return picture
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventsTableViewCell
        let event: EventsModel
        event = eventsList[indexPath.row]
        
        let downloadImageRef = imageReference.child(event.imageName)
        
        let downloadTask = downloadImageRef.getData(maxSize: 1024*1024*12) { (data, error) in
            //if let data = data{
            //    let picture = UIImage(data: data)
            //    self.imagesList.append(picture!)
            //}
            //print(error ?? "No error")
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
        cell.dateLabel.text = event.date
        cell.beginLabel.text = event.beginHour
        cell.endLabel.text = event.endHour
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC")
        let nv = UINavigationController(rootViewController: detailVC)
        present(nv, animated: true, completion: nil)
        
    }
    
}

