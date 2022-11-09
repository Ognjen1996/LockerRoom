
import UIKit

class TabBarController: UITabBarController {
    
    var user: Login

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .black
        tabBar.tintColor = .white
        configureTabBar()
        // Do any additional setup after loading the view.
    }
    
    
    init(user: Login) {
        
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTabBar() {
        let storyBoard = UIStoryboard.init(name: "Home", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController" ) as? HomeViewController else {return}
        vc.presenter = HomePresenter(user: user)
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeicon"), selectedImage: UIImage(named: "homeicon"))
        
        let storyBoard2 = UIStoryboard.init(name: "Chat", bundle: nil)
        guard let vcWeekly = storyBoard2.instantiateViewController(withIdentifier: "ChatViewController" ) as? ChatViewController else {return}
        vcWeekly.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "chaticon"), selectedImage: UIImage(named: "weeklyicon"))
        
        let storyBoard1 = UIStoryboard.init(name: "Calendar", bundle: nil)
        guard let vcShare = storyBoard1.instantiateViewController(withIdentifier: "CalendarViewController" ) as? CalendarViewController else {return}
        vcShare.presenter = CalendarPresenter(user: user)
        vcShare.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendaricon"), selectedImage: UIImage(named: "shareicon"))
        
        let viewControllerList = [vcWeekly, vc,  vcShare]
        viewControllers = viewControllerList.map {
            UINavigationController(rootViewController: $0)
        }
        selectedIndex = 1
    }

}


