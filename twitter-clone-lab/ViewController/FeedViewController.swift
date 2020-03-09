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
    override func loadView()
    {
        super.loadView()
        //
        view = FeedView()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        guard let view = view as? FeedView else { return }
        navigationItem.titleView = view.logo
    }
}
