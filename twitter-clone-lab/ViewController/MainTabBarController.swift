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
        let feed = FeedViewController()
        feed.tabBarItem.image = UIImage(systemName: "house")
        feed.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let explore = ExploreViewController()
        explore.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        explore.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        
        viewControllers = [feed, explore]
    }
}
