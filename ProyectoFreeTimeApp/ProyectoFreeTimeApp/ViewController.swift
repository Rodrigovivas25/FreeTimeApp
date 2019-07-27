//
//  ViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Rodrigo Vivas on 7/23/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "lightblue")!
        self.view.sendSubviewToBack(backgroundImage)
        // Do any additional setup after loading the view.
    }

    
}

