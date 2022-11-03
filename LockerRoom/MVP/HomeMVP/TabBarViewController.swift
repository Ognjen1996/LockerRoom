
import UIKit

class TabBarController: UITabBarController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .white
        tabBar.tintColor = .white
        configureTabBar()
        // Do any additional setup after loading the view.
    }
    
    private func configureTabBar() {
        let storyBoard = UIStoryboard.init(name: "Home", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController" ) as? HomeViewController else {return}
        vc.presenter = HomePresenter()
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeicon"), selectedImage: UIImage(named: "homeicon"))
        
        let storyBoard2 = UIStoryboard.init(name: "Chat", bundle: nil)
        guard let vcWeekly = storyBoard2.instantiateViewController(withIdentifier: "ChatViewController" ) as? ChatViewController else {return}
        vcWeekly.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "chaticon"), selectedImage: UIImage(named: "weeklyicon"))
        
        let storyBoard1 = UIStoryboard.init(name: "Calendar", bundle: nil)
        guard let vcShare = storyBoard1.instantiateViewController(withIdentifier: "CalendarViewController" ) as? CalendarViewController else {return}
        vcShare.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendaricon"), selectedImage: UIImage(named: "shareicon"))
        
        let viewControllerList = [vcWeekly, vc,  vcShare]
        viewControllers = viewControllerList.map {
            UINavigationController(rootViewController: $0)
        }
        selectedIndex = 1
    }

}


