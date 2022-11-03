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

    
    func setup(with player: PlayerModel) {
        nameLabel.text = player.data.first_name + " " + player.data.last_name + "\n #" + String(player.data.jersey_number)
        heightLabel.text = player.data.height
        positionLabel.text = player.data.position.name_small
        ageLabel.text = String(player.data.age)
        
        let url = URL(string: player.data.player_image)
        playerPicture.layer.cornerRadius = playerPicture.frame.size.width/2
//        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        playerPicture.clipsToBounds = true
        playerPicture.kf.setImage(with: url)

        
    }
}
