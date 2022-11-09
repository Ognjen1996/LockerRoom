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

    
    func setupWeights(with training: [WeightData], n: Int){
        nameLabel.text = training[n].name
        let date = training[n].date
        let dayHour = date.split(separator: " ")
        
        datelabel.text = dayHour[0] + "\n" + dayHour[1]
    }
    func setupMedicals(with medicals: [MedicalData], n: Int){
        nameLabel.text = medicals[n].name + "\n" + medicals[n].comment
        
        let date = medicals[n].date
        let dayHour = date.split(separator: " ")
        datelabel.text = dayHour[0] + "\n" + dayHour[1]
    }
    func setupPractice(with practice: [PracticeData], n: Int) {
        nameLabel.text = practice[n].name
        
        let date = practice[n].date
        let dayHour = date.split(separator: " ")
        datelabel.text = dayHour[0] + "\n" + dayHour[1]
    }
    
    func setupGame(with game: [GameData], n: Int) {
        nameLabel.text = game[n].team_home.team_name + " vs " + game[n].team_away.team_name
        let date = game[n].date
        let dayHour = date.split(separator: " ")
        datelabel.text = dayHour[0] + "\n" + dayHour[1]
    }

}
