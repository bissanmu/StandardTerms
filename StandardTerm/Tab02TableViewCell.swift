//
//  Tab02TableViewCell.swift
//  StandardTerm
//
//  Created by admin on 2017. 10. 29..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit

class Tab02TableViewCell: UITableViewCell {

    @IBOutlet weak var obj_knm: UILabel!
    @IBOutlet weak var obj_enm: UILabel!
    @IBOutlet weak var eng_full_name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
