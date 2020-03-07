//
//  MainViewController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 07/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class MainViewController: UIViewController
{
    override func loadView()
    {
        view = UIView()
        view.backgroundColor = UIColor.appTheme.blue.rgb
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //load main tab view controller
        let mainTabViewController = MainTabBarController()
        addChild(mainTabViewController)
        mainTabViewController.view.frame = view.bounds
        view.addSubview(mainTabViewController.view)
        mainTabViewController.didMove(toParent: self)
        
        //
        AuthService.shared.getCurrentUser { error, user in
            guard user == nil else { return }
            
            let loginViewController = LoginViewController()
            
            let authNavigationController = UINavigationController()
            authNavigationController.view.frame = self.view.bounds
            authNavigationController.navigationBar.isHidden = true
            authNavigationController.pushViewController(loginViewController, animated: false)
            
            self.addChild(authNavigationController)
            self.view.addSubview(authNavigationController.view)
            
            loginViewController.didMove(toParent: self)
        }
    }
}
