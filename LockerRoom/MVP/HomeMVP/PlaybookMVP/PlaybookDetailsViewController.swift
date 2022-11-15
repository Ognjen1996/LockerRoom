//
//  DetailsViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 14.11.22..
//

import UIKit

class PlaybookDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuButton: UIButton!
    
    var data: PlaybookData?
    var imageArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        collectionView.collectionViewLayout = layout
        setupButton()
        setupDetails()
        // Do any additional setup after loading the view.
    }
    
    func setupDetails() {
        guard let data = data else {return}
        for action in data.play_book_sub_category {
            detailsLabel.text! += action.general_comment + "\n\n"
            for play in action.images {
                imageArray.append(play.file_path)
                detailsLabel.text! +=  "\n" + play.comment
            }
        }
    }
    private func setupButton() {
        
        let hideimages = { (action: UIAction) in
            self.collectionView.isHidden = true
            self.setupDetails()
        }
        let showimages = { (action: UIAction) in
            self.collectionView.isHidden = false
            self.detailsLabel.text = ""
        }
        
        menuButton.menu = UIMenu(children: [
            UIAction(title: "General Comments", state: .on, handler: hideimages),
            UIAction(title: "Images", state: .off, handler: showimages)
        ])
        
        if #available(iOS 15.0, *) {
            menuButton.changesSelectionAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
        menuButton.showsMenuAsPrimaryAction = true
        
    }
}
extension PlaybookDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlaybookCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaybookCollectionViewCell", for: indexPath) as! PlaybookCollectionViewCell
        let img = imageArray[indexPath.row]
        cell.setupCell(with: img)
        return cell
    }
}
extension PlaybookViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width / 2, height: collectionViewFrame.height / 2)
    }
}

