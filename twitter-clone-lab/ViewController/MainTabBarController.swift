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
        let feed = navigationController(with: feedController,
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
    
    
    // MARK: - View Controllers
    lazy var feedController: FeedViewController = {
        var controller = FeedViewController()
        return controller
    }()
    
    
    // MARK: - Setup Views
    func setupViews()
    {
        //tab bar
        tabBar.tintColor = UIColor.appTheme.blue.rgb
        
        //action button
        view.addSubview(actionButton)
        actionButton.sizeAnchor(width: 56, height: 56)
        actionButton.positionAnchor(trailing: view.trailingAnchor, trailingMargin: 16, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomMargin: 64)
        actionButton.addTarget(self, action: #selector(onActionButtonTouch), for: .touchUpInside)
    }
    
    
    // MARK: - Actions
    @objc func onActionButtonTouch()
    {
        guard let user = user else { return }
        let sendTweetController = SendTweetViewController(user: user)
        //
        let navigationController = UINavigationController(rootViewController: sendTweetController)
        navigationController.modalPresentationStyle = .fullScreen
        //
        present(navigationController, animated: true, completion: nil)
    }
    
    
    // MARK: - Action Button
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = UIColor.appTheme.blue.rgb
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.cornerRadius = 56 / 2
        return button
    }()
    
    
    // MARK: - User
    var user: UserModel?
    {
        didSet {
            guard let user = user else { return }
            feedController.user = user
        }
    }
}
