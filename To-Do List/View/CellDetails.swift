//
//  CellDetails.swift
//  To-Do List
//
//  Created by Ehab Eletreby on 7/29/19.
//  Copyright © 2019 Ehab Eletreby. All rights reserved.
//

import UIKit

class CellDetails: UITableViewCell {
    @IBOutlet weak var cellLabl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(textCell: String) {
        cellLabl.text = textCell
    }
    
}
