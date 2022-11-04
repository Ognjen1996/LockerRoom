//
//  LeaguesTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 4.11.22..
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet var leagueLabel: UILabel!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func populateCell(with player: Leagues) {
        leagueLabel.text = player.league_name
        
    }


}

