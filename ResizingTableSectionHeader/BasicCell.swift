//
//  BasicCell.swift
//  ResizingTableSectionHeader
//
//  Created by Brad Leege on 6/9/21.
//

import UIKit

class BasicCell: UITableViewCell {

    @IBOutlet weak var cellNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellNumberLabel.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
