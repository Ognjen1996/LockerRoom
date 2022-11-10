//
//  LoockerRoomTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 10.11.22..
//

import UIKit

class LoockerRoomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelLR: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with menu: [String], n: Int) {
        labelLR.text = menu[n]
    }

}
