//
//  HomeView.swift
//  LockerRoom
//
//  Created by Ognjen on 1.11.22..
//

import UIKit
import Kingfisher

class HomeView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var playerPicture: UIImageView!
    @IBOutlet weak var leaguesButton: UIButton!
    
    @IBOutlet weak var ppgLabel: UILabel!
    @IBOutlet weak var rpgLabel: UILabel!
    @IBOutlet weak var apgLabel: UILabel!
    @IBOutlet weak var bpgLabel: UILabel!
    @IBOutlet weak var fpgLabel: UILabel!
    @IBOutlet weak var tpmLabel: UILabel!
    @IBOutlet weak var tppLabel: UILabel!
    @IBOutlet weak var spgLabel: UILabel!


    
    func setup(with player: PlayerModel) {
        leaguesButton.tintColor = .opaqueSeparator
        var labels = [nameLabel, heightLabel, positionLabel, locationLabel, ageLabel]
        for label in labels {
            if let label = label {
                label.textColor = .white
            }
        }
        
        nameLabel.text = player.data.first_name + " " + player.data.last_name + "\n #" + String(player.data.jersey_number)
        heightLabel.text = player.data.height + "cm"
        positionLabel.text = player.data.position.name_small
        ageLabel.text = String(player.data.age)
        locationLabel.text = player.data.weight + "kg"
        
        let url = URL(string: player.data.player_image)
        playerPicture.layer.cornerRadius = playerPicture.frame.size.width / 2
//        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        playerPicture.clipsToBounds = true
        playerPicture.kf.setImage(with: url)

        
        ppgLabel.text = "PTS \n" + player.data.average.PTS
        rpgLabel.text = "RPG \n" + player.data.average.REB
        apgLabel.text = "APG \n" + player.data.average.AST
        bpgLabel.text = "BPG \n" + player.data.average.BLK
        tpmLabel.text = "TPM \n" + player.data.average.ThreePM
        fpgLabel.text = "FPB \n" + player.data.average.FGpercent
        tppLabel.text = "TPP \n" + player.data.average.ThreePercent
        spgLabel.text = "SPG \n" + player.data.average.STL
        
    }
}
