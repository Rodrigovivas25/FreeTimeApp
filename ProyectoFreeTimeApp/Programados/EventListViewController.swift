//
//  EventListViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Noemí Rodríguez Sandoval on 8/10/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit
import Firebase

class EventListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventListTableView: UITableView!
    
    var imageReference: StorageReference {
        return Storage.storage().reference().child("imagenes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventListTableView.delegate = self
        eventListTableView.dataSource = self
        eventListTableView.rowHeight = 160
        

        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailContainer.shared.showEvent().count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventListCell") as? EventListTableViewCell else { return UITableViewCell() }
        //Accedemos al elemento del carrito
        let event = DetailContainer.shared.showEvent()[indexPath.row]
        let downloadImageRef = imageReference.child(event.imageName)
        
        downloadImageRef.getData(maxSize: 1024*1024*12) { (data, error) in
            if error != nil{
                print("cargando")
            }
            else{
                cell.eventImage.image = UIImage(data: data!)
            }
        }
        cell.eventName.text = event.name
        cell.beginDate.text = event.beginDate
        cell.endDate.text = event.endDate
        cell.beginHour.text = event.endHour
        cell.endHour.text = event.endHour

        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

