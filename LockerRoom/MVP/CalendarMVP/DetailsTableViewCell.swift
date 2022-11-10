//
//  DetailsTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 10.11.22..
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setupWeights(with data: WeightData, n: Int) {
        nameLabel.text = data.name
        commentLabel.text = data.exericise[n].comment
        setsLabel.text = "sets: " + String(data.exericise[n].sets) + ", reps: " + String(data.exericise[n].reps) + ", weight: " +  String(data.exericise[n].weight)
    }
}
