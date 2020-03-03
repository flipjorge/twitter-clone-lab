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
        setupViews()
    }
    
    
    // MARK: - Views
    func setupViews()
    {
        //background
        view.backgroundColor = .systemGray2
        
        //title
        navigationItem.title = "Explore"
    }
}
