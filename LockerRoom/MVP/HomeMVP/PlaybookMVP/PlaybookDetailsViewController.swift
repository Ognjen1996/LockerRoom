//
//  DetailsViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 14.11.22..
//

import UIKit

class PlaybookDetailsViewController: UIViewController {

    
    @IBOutlet weak var detailsLabel: UILabel!
    var data: PlaybookData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetails()
        // Do any additional setup after loading the view.
    }

    func setupDetails() {
        guard let data = data else {return}
        for action in data.play_book_sub_category {
            detailsLabel.text! += action.general_comment + "\n\n"
            for play in action.images {
                detailsLabel.text! +=  "\n" + play.comment
            }
        }
    }
    
}
