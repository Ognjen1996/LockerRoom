//
//  RosterTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 17.11.22..
//

import UIKit

class RosterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with roster: RosterPlayers) {
        if let stats = roster.average {
            label.text = roster.first_name + " FGM: " + stats.FGM
        } else {
            label.text = roster.first_name + " Nema podataka"
        }
        
    }

}
