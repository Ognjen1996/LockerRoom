//
//  PlaybookTableViewCell.swift
//  LockerRoom
//
//  Created by Ognjen on 14.11.22..
//

import UIKit
import Kingfisher

class PlaybookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playLabel: UILabel!
    @IBOutlet weak var playImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with data: PlaybookData, n: Int) {
        playLabel.text = data.name
        let img = URL(string: data.play_book_sub_category[n].images[0].file_path)
        playImage.kf.setImage(with: img)
    }

}
