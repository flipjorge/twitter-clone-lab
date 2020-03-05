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
        setupViewsController()
        setupViews()
    }
    
    
    // MARK: - Setup Views Controllers
    func setupViewsController()
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
        navController.navigationBar.tintColor = UIColor.appTheme.white.rgb
        if tabBarImage != nil { navController.tabBarItem.image = tabBarImage }
        if selectedTabBarImage != nil { navController.tabBarItem.selectedImage = selectedTabBarImage }
        //
        return navController
    }
    
    
    // MARK: - Setup Views
    func setupViews()
    {
        //tab bar
        tabBar.tintColor = .systemBackground
        
        //action button
        view.addSubview(actionButton)
        actionButton.sizeAnchor(width: 56, height: 56)
        actionButton.positionAnchor(trailing: view.rightAnchor, trailingMargin: 16, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomMargin: 64)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    
    // MARK: - Action Button
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = UIColor.appTheme.blue.rgb
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
}
