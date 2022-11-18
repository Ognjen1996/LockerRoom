//
//  RosterStatsViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 17.11.22..
//

import UIKit

class RosterStatsViewController: UIViewController {
    
    var player: RosterPlayers?
    
    @IBOutlet weak var playerImage1: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ptsLabel: UILabel!
    @IBOutlet weak var astLabel: UILabel!
    @IBOutlet weak var rebLabel: UILabel!
    @IBOutlet weak var fgmLabel: UILabel!
    @IBOutlet weak var gpLabel: UILabel!
    @IBOutlet weak var gsLabel: UILabel!
    @IBOutlet weak var stlLabel: UILabel!
    @IBOutlet weak var blkLabel: UILabel!
    @IBOutlet weak var tovLabel: UILabel!
    @IBOutlet weak var drebLabel: UILabel!
    @IBOutlet weak var orebLabel: UILabel!
    @IBOutlet weak var fgpLabel: UILabel!
    @IBOutlet weak var fgaLabel: UILabel!
    @IBOutlet weak var threepmLabel: UILabel!
    @IBOutlet weak var threepaLabel: UILabel!
    @IBOutlet weak var threeppLabel: UILabel!
    @IBOutlet weak var ftmLabel: UILabel!
    @IBOutlet weak var ftaLabel: UILabel!
    @IBOutlet weak var ftpLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let player = player {
            setupStats(with: player)
        }
        
        // Do any additional setup after loading the view.
    }
    
    func setupStats(with roster: RosterPlayers) {
        let number = String(roster.jersey_number)
        let name = roster.first_name
        let position = roster.position.name_small
        guard let nameLabel = nameLabel else {return}
        nameLabel.text = name
        
        let url = URL(string: roster.player_image)
        playerImage1.layer.cornerRadius = playerImage1.frame.width / 2
        playerImage1.kf.setImage(with: url)
        
        if let stats = roster.average {
            nameLabel.text = roster.first_name + "\n" + roster.position.name_small + "| #" + number + "| " + roster.height + "m"
            ptsLabel.text = "PTS\n" + stats.PTS
            astLabel.text = "AST\n" + stats.AST
            fgmLabel.text = "FGM\n" + stats.FGM
            rebLabel.text = "REB\n" + stats.REB
            stlLabel.text = "STL\n" + stats.STL
            orebLabel.text = "OREB\n" + stats.OREB
            drebLabel.text = "DRE\n" + stats.DREB
            blkLabel.text = "BLK\n" + stats.BLK
            threepaLabel.text = "3PA\n" + stats.ThreePA
            threepmLabel.text = "3PM\n" + stats.ThreePM
            threeppLabel.text = "3P%\n" + stats.ThreePercent
            gpLabel.text = "GP\n" + stats.GP
            gsLabel.text = "GS\n" + stats.GS
            tovLabel.text = "TOV\n" + stats.TOV
            fgaLabel.text = "FGA\n" + stats.FGA
            fgpLabel.text = "FG%\n" + stats.FGpercent
            ftmLabel.text = "FTM\n" + stats.FTM
            ftaLabel.text = "FTA\n" + stats.FTA
            ftpLabel.text = "FT%\n" + stats.FTPercent
            minLabel.text = "Mins\n" + stats.MIN
        }
        else {
            nameLabel.text = roster.first_name + "\n" + roster.position.name_small + "| #" + number + "| " + roster.height + "m"
            ptsLabel.text = "PTS\n - "
            astLabel.text = "AST\n - "
            fgmLabel.text = "FGM\n - "
            rebLabel.text = "REB\n - "
            stlLabel.text = "STL\n - "
            orebLabel.text = "OREB\n - "
            drebLabel.text = "DRE\n - "
            blkLabel.text = "BLK\n - "
            threepaLabel.text = "3PA\n - "
            threepmLabel.text = "3PM\n - "
            threeppLabel.text = "3P%\n - "
            gpLabel.text = "GP\n - "
            gsLabel.text = "GS\n - "
            tovLabel.text = "TOV\n - "
            fgaLabel.text = "FGA\n - "
            fgpLabel.text = "FG%\n - "
            ftmLabel.text = "FTM\n - "
            ftaLabel.text = "FTA\n - "
            ftpLabel.text = "FT%\n - "
            minLabel.text = "Mins\n - "
        }
        
    }
    
}
