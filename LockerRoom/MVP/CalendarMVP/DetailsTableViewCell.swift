//
//  DetailsTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 10.11.22..
//

import UIKit
import Kingfisher

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var homeTeamImage: UIImageView!
    @IBOutlet weak var awayTeamImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWeights(with data: WeightData, n: Int) {
        homeTeamImage.isHidden = true
        awayTeamImage.isHidden = true
        nameLabel.text = data.name
        commentLabel.text = data.exericise[n].comment
        setsLabel.text = "sets: " + String(data.exericise[n].sets) + ", reps: " + String(data.exericise[n].reps) + ", weight: " +  String(data.exericise[n].weight)
    }
    func setupGames(with data: GameData, n: Int) {
        let colorChange = [NSAttributedString.Key.foregroundColor: UIColor.red]
        let colorSame = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        nameLabel.text = data.team_home.team_name + " - " +  data.team_away.team_name
        
        let homeScore = String(data.home_result)
        let awayScore = String(data.away_result)
        let line = " - "
        let lineAtr = NSMutableAttributedString(string: line,attributes: colorSame)
        if data.home_result > data.away_result {
            let homeString = NSMutableAttributedString(string: homeScore, attributes: colorChange)
            let awayString = NSMutableAttributedString(string: awayScore, attributes: colorSame)
            homeString.append(lineAtr)
            homeString.append(awayString)
            commentLabel.attributedText = homeString
        }
        else {
            let homeString = NSMutableAttributedString(string: awayScore, attributes: colorChange)
            let awayString = NSMutableAttributedString(string: homeScore, attributes: colorSame)
            homeString.append(lineAtr)
            homeString.append(awayString)
            commentLabel.attributedText = homeString
            
        }
        let homeurl = URL(string: data.team_home.team_logo)
        let awayurl = URL(string: data.team_away.team_logo)
        homeTeamImage.kf.setImage(with: homeurl)
        awayTeamImage.kf.setImage(with: awayurl)
        homeTeamImage.isHidden = false
        awayTeamImage.isHidden = false
        setsLabel.text = data.date
    }
    func setupPractice(with data: PracticeData, n: Int) {
        homeTeamImage.isHidden = true
        awayTeamImage.isHidden = true
        nameLabel.text = data.name
        commentLabel.text = data.date
        setsLabel.text = data.typeEvent
    }
    func setupMedical(with data: MedicalData, n: Int) {
        homeTeamImage.isHidden = true
        awayTeamImage.isHidden = true
        nameLabel.text = data.name
        commentLabel.text = data.comment
        setsLabel.text = data.date
    }
}
