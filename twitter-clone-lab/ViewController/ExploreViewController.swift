//
//  ExploreViewController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 02/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController
{
    // MARK: - Lifecycle    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        view.backgroundColor = .systemGray2
        //
        setupTabBar()
    }
    
    //MARK: - Tab Bar
    func setupTabBar()
    {
        tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
    }
}
