//
//  ContactDetailTableViewCell.swift
//  ContactManagerSwift
//
//  Created by Saylee Pradhan on 8/22/17.
//  Copyright © 2017 Saylee Pradhan. All rights reserved.
//

import UIKit

class ContactDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
