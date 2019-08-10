//
//  DetailCellTableViewCell.swift
//  ProyectoFreeTimeApp
//
//  Created by Noemí Rod on 8/6/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit

class DetailCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var beginDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var beginHourLabel: UILabel!
    @IBOutlet weak var endHourLabel: UILabel!
    //@IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
