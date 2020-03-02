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
        
        viewControllers = [feed]
    }
}
