//
//  FilterViewController.swift
//  ProyectoFreeTimeApp
//
//  Created by Rodrigo Vivas on 8/10/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var radioButton1: UIButton!
    @IBOutlet weak var radioButton2: UIButton!
    @IBOutlet weak var radioButton3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectRButton1(_ sender: UIButton) {
        if radioButton2.isSelected || radioButton3.isSelected{
            radioButton1.isSelected = true
            radioButton2.isSelected = false
            radioButton3.isSelected = false
        }else{
            radioButton1.isSelected = true
        }
    }
    @IBAction func selectRButton2(_ sender: UIButton) {
        if radioButton1.isSelected || radioButton3.isSelected{
            radioButton1.isSelected = false
            radioButton2.isSelected = true
            radioButton3.isSelected = false
        }else{
            radioButton2.isSelected = true
        }
    }
    @IBAction func selectRButton3(_ sender: Any) {
        if radioButton1.isSelected || radioButton2.isSelected{
            radioButton1.isSelected = false
            radioButton2.isSelected = false
            radioButton3.isSelected = true
        }else{
            radioButton3.isSelected = true
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
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
