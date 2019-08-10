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
    
     let event = EventsModel(name: [""] as? String ?? "", beginDate: ["FechaInicio"] as? String ?? "", endDate: ["FechaFin"] as? String ?? "", beginHour: ["HoraInicio"] as? String ?? "", endHour: ["HoraFin"] as? String ?? "", imageName: "\(String(describing: ["Imagen"] as? String ?? "")).jpg", latitud: ["Latitud"] as? Double ?? 0.0, longitud: ["Longitud"] as? Double ?? 0.0, category: ["Categoria"] as? String ?? "", price: ["Precio"] as? Double ?? 0.0)
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailContainer.shared.showEvent().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailCellTableViewCell else { return UITableViewCell() }
        let item = DetailContainer.shared.showEvent()[indexPath.row]
        cell.nameLabel?.text = item.name
        cell.beginDateLabel?.text = item.beginDate
        cell.endDateLabel?.text = item.endDate
        cell.beginHourLabel?.text = item.beginHour
        cell.endHourLabel?.text = item.endHour
        cell.imageView?.image = UIImage(named: item.imageName)
        cell.categoryLabel?.text = item.category
        //cell.priceLabel. = item.price
        return cell
    }
}

