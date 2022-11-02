//
//  HomeViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 31.10.22..
//

import UIKit

class HomeViewController: UIViewController {
    
    var player: PlayerModel?
    
    // MARK: - UIView Properties
    var homeView: HomeView {
        loadViewIfNeeded()
        return view as! HomeView
    }
    
    // MARK: - Presenter Properties
    var presenter: HomePresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
//        presenter?.fetchData()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.fetchData()
    }
    
    
}


// MARK: - Private Methods
extension HomeViewController {
    private func setup() {
        guard let player = player else { return }
        homeView.setup(with: player)
    }
    
    private func setupDelegates() {
        presenter?.delegate = self
    }
}
extension HomeViewController: HomePresenenterDelegate {
    func homePresenter(_ presenter: HomePresenter, data: PlayerModel) {
        self.player = data
    }
    
    
}
