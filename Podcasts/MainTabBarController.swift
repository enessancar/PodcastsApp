//
//  MainTabBarController.swift
//  Podcasts
//
//  Created by Enes Sancar on 6.05.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .purple
        
        viewControllers = [
            createNavController(viewController: UIViewController(), title: "Favorites", imageName: "play.circle.fill"),
            createNavController(viewController: UIViewController(), title: "Search", imageName: "magnifyingglass"),
            createNavController(viewController: UIViewController(), title: "Downloads", imageName: "square.stack.fill")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
    }
}
