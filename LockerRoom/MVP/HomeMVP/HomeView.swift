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
        
        let optionClosure = {(action: UIAction) in
            if action.title == "KRK"
            {
                self.ppgLabel.text = "PTS \n" + player.data.leagues[1].stats.PTS
                self.rpgLabel.text = "RPG \n" + player.data.leagues[1].stats.REB
                self.apgLabel.text = "APG \n" + player.data.leagues[1].stats.AST
                self.bpgLabel.text = "BPG \n" + player.data.leagues[1].stats.BLK
                self.tpmLabel.text = "TPM \n" + player.data.leagues[1].stats.ThreePM
                self.fpgLabel.text = "FPB \n" + player.data.leagues[1].stats.FGpercent
                self.tppLabel.text = "TPP \n" + player.data.leagues[1].stats.ThreePercent
                self.spgLabel.text = "SPG \n" + player.data.leagues[1].stats.STL
            }
            else if action.title == "1 MRLC A" {
                self.ppgLabel.text = "PTS \n" + player.data.leagues[0].stats.PTS
                self.rpgLabel.text = "RPG \n" + player.data.leagues[0].stats.REB
                self.apgLabel.text = "APG \n" + player.data.leagues[0].stats.AST
                self.bpgLabel.text = "BPG \n" + player.data.leagues[0].stats.BLK
                self.tpmLabel.text = "TPM \n" + player.data.leagues[0].stats.ThreePM
                self.fpgLabel.text = "FPB \n" + player.data.leagues[0].stats.FGpercent
                self.tppLabel.text = "TPP \n" + player.data.leagues[0].stats.ThreePercent
                self.spgLabel.text = "SPG \n" + player.data.leagues[0].stats.STL
            }
            else if action.title == "MRLC PLAYOFF" {
                self.ppgLabel.text = "PTS \n" + player.data.leagues[2].stats.PTS
                self.rpgLabel.text = "RPG \n" + player.data.leagues[2].stats.REB
                self.apgLabel.text = "APG \n" + player.data.leagues[2].stats.AST
                self.bpgLabel.text = "BPG \n" + player.data.leagues[2].stats.BLK
                self.tpmLabel.text = "TPM \n" + player.data.leagues[2].stats.ThreePM
                self.fpgLabel.text = "FPB \n" + player.data.leagues[2].stats.FGpercent
                self.tppLabel.text = "TPP \n" + player.data.leagues[2].stats.ThreePercent
                self.spgLabel.text = "SPG \n" + player.data.leagues[2].stats.STL
            }
            else if action.title == "Average" {
                self.ppgLabel.text = "PTS \n" + player.data.average.PTS
                self.rpgLabel.text = "RPG \n" + player.data.average.REB
                self.apgLabel.text = "APG \n" + player.data.average.AST
                self.bpgLabel.text = "BPG \n" + player.data.average.BLK
                self.tpmLabel.text = "TPM \n" + player.data.average.ThreePM
                self.fpgLabel.text = "FPB \n" + player.data.average.FGpercent
                self.tppLabel.text = "TPP \n" + player.data.average.ThreePercent
                self.spgLabel.text = "SPG \n" + player.data.average.STL
            }

        }
        
        var optionsArray = [UIAction]()
        optionsArray.append(UIAction(title: "Average", state: .off, handler: optionClosure))
        for league in player.data.leagues{
            let action = UIAction(title: league.league_name, state: .off, handler: optionClosure)
            optionsArray.append(action)
        }
        optionsArray[0].state = .on
        let optionsMenu = UIMenu(title: "", options: .displayInline, children: optionsArray)
        popUpButtonStates.menu = optionsMenu
        popUpButtonStates.changesSelectionAsPrimaryAction = true
        popUpButtonStates.showsMenuAsPrimaryAction = true
        
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
        
    }
}
