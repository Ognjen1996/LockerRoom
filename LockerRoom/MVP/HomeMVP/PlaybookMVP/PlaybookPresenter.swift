//
//  PlaybookPresenter.swift
//  LockerRoom
//
//  Created by Ognjen on 14.11.22..
//

import Foundation
import Alamofire

protocol PlaybookPresenterDelegate: AnyObject {
    func playbookPresenter(_ presenter: PlaybookPresenter, data: [PlaybookData])
}


class PlaybookPresenter {
    
    weak var delegate: PlaybookPresenterDelegate?
 
    
    func fetchData() {
        let baseURL = "https://app.lockerroomsystem.com/api/play-books"
        guard let url = URL(string: baseURL) else {return}
        var request = URLRequest(url: url)
        request.method = .get
        
        AF.request(request).response { [weak self] response in
            guard let self = self,
                  let data = response.data
            else {return}
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(PlaybookModel.self, from: data)
                let userArray = userData.data
                self.delegate?.playbookPresenter(self, data: userArray)
            } catch let error {
                debugPrint(error)
            }
            
        }
        
    }
    
    
}
