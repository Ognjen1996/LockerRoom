//
//  CalendarTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 7.11.22..
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datelabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setup(with training: [WeightData], n: Int){
        nameLabel.text = training[n].name
        let date = training[n].date
        let dayHour = date.split(separator: " ")
        
        datelabel.text = dayHour[0] + "\n" + dayHour[1]
    }
}
