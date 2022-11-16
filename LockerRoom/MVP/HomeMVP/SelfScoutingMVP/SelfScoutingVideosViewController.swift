//
//  SelfScoutingVideosViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 16.11.22..
//

import UIKit
import WebKit
class SelfScoutingVideosViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet var webKit: WKWebView!
    var selfScoutingVideos: SelfScoutingData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        details()
        

        // Do any additional setup after loading the view.
    }
    
    func details() {
        let videoLink = selfScoutingVideos?.videos[0].video
        guard let url = URL(string: "https://player.vimeo.com/video/\(videoLink ?? "489512234")") else {return}
        let request = URLRequest(url: url)
        
        webKit.load(request)
        guard let title = selfScoutingVideos?.videos[0].title,
              let comment = selfScoutingVideos?.videos[0].comment
              else {return}
        dateLabel.text = title + "\n\n\n"
        commentLabel.text = comment
    }
}
