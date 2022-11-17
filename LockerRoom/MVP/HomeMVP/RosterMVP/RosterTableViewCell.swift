//
//  RosterTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 17.11.22..
//

import UIKit
import Kingfisher

class RosterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ptsLabel: UILabel!
    @IBOutlet weak var astLabel: UILabel!
    @IBOutlet weak var rebLabel: UILabel!
    @IBOutlet weak var fgmLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with roster: RosterPlayers) {
        let number = String(roster.jersey_number)
        let url = URL(string: roster.player_image)
        playerImage.kf.setImage(with: url)
        
        if let stats = roster.average {
            nameLabel.text = roster.first_name + "\n" + roster.position.name_small + "| #" + number + "| " + roster.height + "m"
            ptsLabel.text = "PTS\n" + stats.PTS
            astLabel.text = "AST\n" + stats.AST
            fgmLabel.text = "FGM\n" + stats.FGM
            rebLabel.text = "REB\n" + stats.REB
            
        } else {
            nameLabel.text = roster.first_name + "\n" + roster.position.name_small + "| #" + number + "| " + roster.height + "m"
            ptsLabel.text = "PTS\n - "
            astLabel.text = "AST\n - "
            fgmLabel.text = "FG%\n - "
            rebLabel.text = "REB\n - "
        }
        
    }


}
