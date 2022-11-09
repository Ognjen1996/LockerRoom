//
//  ViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 28.10.22..
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    // MARK: - UIView Properties
    var loginView: LoginView {
        loadViewIfNeeded()
        return view as! LoginView
    }
    
    // MARK: - Presenter Properties
    var presenter: LoginPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
}
    
// MARK: - Private Methods
extension LoginViewController {
    private func setup() {
        loginView.setup()
        setupDelegates()
        setupTargets()
    }
    
    private func setupDelegates() {
        presenter?.delegate = self
    }
    
    private func setupTargets() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonHandler), for: .touchUpInside)
    }
}

// MARK: - Private Targets
extension LoginViewController {
    @objc private func loginButtonHandler() {
        let username = loginView.usernameTextField.text ?? ""
        let password = loginView.passwordTextField.text ?? ""
        presenter?.login(user: username, pass: password)
    }
}
 
extension LoginViewController: LoginPresenterDelegate {
    func loginPresenter(_ presenter: LoginPresenter, didLoginWithUser userData: Login) {
        let tabBar = TabBarController(user: userData)
        tabBar.user = userData
        UIApplication.shared.windows.first?.rootViewController = tabBar
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

