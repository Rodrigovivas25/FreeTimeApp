//
//  DateViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Rodrigo Vivas on 7/25/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fromHourPicker: UIDatePicker!
    @IBOutlet weak var toHourPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func search(_ sender: UIButton) {
        performSegue(withIdentifier: "eventSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventSegue"{
            print("Accediendo a eventos")
        }
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
