//
//  Tab01TableViewCell.swift
//  StandardTerm
//
//  Created by admin on 2017. 10. 28..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit

class Tab01TableViewCell: UITableViewCell {

    @IBOutlet weak var knmLabel: UILabel!
    @IBOutlet weak var enmLabel: UILabel!
    @IBOutlet weak var engFullLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
