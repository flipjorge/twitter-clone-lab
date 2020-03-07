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
    // MARK: - Lifecycle
    override func loadView()
    {
        view = UIView()
        view.backgroundColor = UIColor.appTheme.blue.rgb
        
        try? AuthService.shared.logoutUser()
    }
    
    override func viewDidLoad()
    {
        //load main tab view controller
        mainTabBarController = MainTabBarController()
        guard let tabBar = mainTabBarController else { return }
        //
        addChild(tabBar)
        tabBar.view.frame = view.bounds
        view.addSubview(tabBar.view)
        tabBar.didMove(toParent: self)
        //
        authNavigationViewController = UINavigationController()
        guard let auth = authNavigationViewController else { return }
        auth.view.backgroundColor = UIColor.appTheme.blue.rgb
        auth.view.frame = self.view.bounds
        auth.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        //
        guard shouldVerifyLogin else { return }
        //
        guard let auth = authNavigationViewController else { return }
        auth.modalPresentationStyle = .fullScreen
        self.present(auth, animated: false)
        //
        AuthService.shared.getCurrentUser { [weak self] error, user in
            guard let self = self else { return }
            guard user == nil else {
                self.shouldVerifyLogin = false
                auth.dismiss(animated: true)
                return
            }
            //
            let loginViewController = LoginViewController()
            loginViewController.delegate = self
            auth.pushViewController(loginViewController, animated: true)
        }
    }
    
    
    // MARK: - Verify login
    var shouldVerifyLogin:Bool = true
    
    
    // MARK: - Auth View Controller
    var authNavigationViewController:UINavigationController?
    
    
    // MARK: - Tab Bar View Controller
    var mainTabBarController:MainTabBarController?
}


// MARK: - Login Delegate
extension MainViewController: LoginViewControllerDelegate
{
    func loginViewControllerLoggedIn(viewController: LoginViewController, user: UserModel)
    {
        self.shouldVerifyLogin = false
        authNavigationViewController?.dismiss(animated: true)
    }
}
