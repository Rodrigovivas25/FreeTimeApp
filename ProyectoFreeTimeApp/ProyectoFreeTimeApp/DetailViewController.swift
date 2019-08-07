//
//  DetailViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Noemí Rodríguez Sandoval D3 on 8/2/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var detailTableView: UITableView!
    
    var detail: EventsModel!
    
    //let event = [EventsModel(name: "eventName", date: "eventDate", beginHour: "eventBegin", endHour: "eventEnd", imageName: "\("eventImage").jpg")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Volver", style: .done, target: self, action: #selector(dismissList))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Información del evento"
        
        detailTableView.delegate = self
        detailTableView.dataSource = self

    }
    
    @objc func dismissList(){
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailCellTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        //let detail = EventsModel.init(name: "eventName", date: "eventDate", beginHour: "eventBegin", endHour: "eventEnd", imageName: "\("eventImage").jpg")
       
        return 0
        
        
    }
    

}
