//
//  MainTabBarController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 02/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController
{
    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        view.backgroundColor = .systemBackground
        //
        setupViews()
    }
    
    // MARK: - Setup Views
    func setupViews()
    {
        let feed = navigationController(with: FeedViewController(),
                                        tabBarImage: UIImage(systemName: "house"),
                                        selectedTabBarImage: UIImage(systemName: "house.fill"))
        
        let explore = navigationController(with: ExploreViewController(),
                                           tabBarImage: UIImage(systemName: "magnifyingglass.circle"),
                                           selectedTabBarImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        
        viewControllers = [feed, explore]
    }
    
    func navigationController(with viewController: UIViewController, tabBarImage: UIImage?, selectedTabBarImage: UIImage?) -> UIViewController
    {
        let navController = UINavigationController(rootViewController: viewController)
        if tabBarImage != nil { navController.tabBarItem.image = tabBarImage }
        if selectedTabBarImage != nil { navController.tabBarItem.selectedImage = selectedTabBarImage }
        //
        return navController
    }
}
