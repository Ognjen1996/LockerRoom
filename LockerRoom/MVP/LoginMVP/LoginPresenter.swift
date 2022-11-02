//
//  LoginPresenter.swift
//  LockerRoom
//
//  Created by Ognjen on 31.10.22..
//

import Foundation
import Alamofire

// protocol
protocol LoginPresenterDelegate: AnyObject {
    func loginPresenter(_ presenter: LoginPresenter, didLoginWithUser userData: Login)
}

class LoginPresenter {
    
    weak var delegate: LoginPresenterDelegate?
    
    func login(user: String, pass: String) {
        let requestModel = LoginRequestModel(email: user, password: pass, mobile: "true")
        
        do {
            let bodyData = try JSONEncoder().encode(requestModel)
            let baseURL = "https://app.lockerroomsystem.com/api/auth/login"
            guard let url = URL(string: baseURL) else {return}
            
            var request = URLRequest(url: url)
            request.method = .post
            request.httpBody = bodyData
            request.headers = ["Content-Type": "application/json"]
            AF.request(request).response { response in
                do {
                    let user = try JSONDecoder().decode(Login.self, from: response.data ?? Foundation.Data())
                    // send data using protcol to vc
                    self.delegate?.loginPresenter(self, didLoginWithUser: user)

                    
                } catch {
                    debugPrint(error)
                }
            }
        } catch let error as AFError {
            debugPrint(error)
        } catch {
            
        }
        
    }
}
