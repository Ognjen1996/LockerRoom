//
//  PlaybookCollectionViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 14.11.22..
//

import UIKit
import Kingfisher


class PlaybookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var playImage: UIImageView!
    
    func setupCell(with data: String) {
        let url = URL(string: data)
        playImage.kf.setImage(with: url)
    }
}
