//
//  ViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Rodrigo Vivas on 7/23/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var scheduledEvents: UIButton!
    @IBOutlet weak var searchEvents: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduledEvents.layer.cornerRadius = 10
        searchEvents.layer.cornerRadius = 10
        
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "unam")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        self.title = "Free Time App"

    }
}
