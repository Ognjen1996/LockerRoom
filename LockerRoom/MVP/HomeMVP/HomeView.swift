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
    
    @IBOutlet weak var ppgLabel: UILabel!
    @IBOutlet weak var rpgLabel: UILabel!
    @IBOutlet weak var apgLabel: UILabel!
    @IBOutlet weak var bpgLabel: UILabel!
    @IBOutlet weak var fpgLabel: UILabel!
    @IBOutlet weak var tpmLabel: UILabel!
    @IBOutlet weak var tppLabel: UILabel!
    @IBOutlet weak var spgLabel: UILabel!
    
    @IBOutlet weak var popUpButtonStates: UIButton!


    
    func setup(with player: PlayerModel) {
        
        let optionClosure = { (action: UIAction) in
            
            let options = self.popUpButtonStates.menu?.children ?? []
            
            for (index, option) in options.enumerated() where (option as? UIAction) == action {
                self.setupStatsData(league: player.data.leagues[index])
            }
        }
        
        var optionsArray = [UIAction]()
        for league in player.data.leagues{
            let action = UIAction(title: league.league_name, state: .off, handler: optionClosure)
            optionsArray.append(action)
        }
        let optionsMenu = UIMenu(title: "", options: .displayInline, children: optionsArray)
        popUpButtonStates.menu = optionsMenu
        popUpButtonStates.changesSelectionAsPrimaryAction = true
        popUpButtonStates.showsMenuAsPrimaryAction = true
        (popUpButtonStates.menu?.children[0] as? UIAction)?.state = .on
        setupStatsData(league: player.data.leagues[0])
        let labels = [nameLabel, heightLabel, positionLabel, locationLabel, ageLabel]
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
        playerPicture.clipsToBounds = true
        playerPicture.kf.setImage(with: url)
        
    }
    
    private func setupStatsData(league: Leagues) {
        
        self.ppgLabel.text = "PTS \n" + league.stats.PTS
        self.rpgLabel.text = "RPG \n" + league.stats.REB
        self.apgLabel.text = "APG \n" + league.stats.AST
        self.bpgLabel.text = "BPG \n" + league.stats.BLK
        self.tpmLabel.text = "TPM \n" + league.stats.ThreePM
        self.fpgLabel.text = "FPB \n" + league.stats.FGpercent
        self.tppLabel.text = "TPP \n" + league.stats.ThreePercent
        self.spgLabel.text = "SPG \n" + league.stats.STL
    }
}
