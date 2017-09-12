//
//  StoreTVC.swift
//  TableViewExmp
//
//  Created by Ali Farhat on 4/12/15.
//  Copyright (c) 2015 ali farhat. All rights reserved.
//

import UIKit

class StoreTVC: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var imgvImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
