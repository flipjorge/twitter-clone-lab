//
//  FeedViewController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 02/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController
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
        view.backgroundColor = .systemGray
        
        //title
        let iconView = UIImageView(image: UIImage(named: "twitter-480"))
        iconView.contentMode = .scaleAspectFit
        navigationItem.titleView = iconView
    }
}
