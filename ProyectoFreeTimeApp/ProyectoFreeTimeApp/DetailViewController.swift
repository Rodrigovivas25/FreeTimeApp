//
//  DetailViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Noemí Rodríguez Sandoval D3 on 8/2/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem(title: "Regresar", style: .done, target: self, action: #selector(dismissList))
        navigationItem.leftBarButtonItem = backButton
        let addButton = UIBarButtonItem(title: "Agregar Evento", style: .done, target: self, action: #selector(dismissList))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.title = "Próximos eventos"
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

}
