//
//  CalendarTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 7.11.22..
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setup(with training: [WeightData], n: Int){
        label.text = training[n].name
    }
}
