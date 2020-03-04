//
//  LoginViewController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 04/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    // MARK: Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        setupViews()
    }
    
    
    // MARK: - Setup Views
    func setupViews()
    {
        //background
        view.backgroundColor = UIColor.appTheme.blue.rgb
        
        //icon
        view.addSubview(logo)
        logo.centerXAnchor(on: view, top: view.safeAreaLayoutGuide.topAnchor)
        logo.sizeAnchor(width: 150, height: 150)
    }
    
    
    // MARK: - Icon
    let logo: UIImageView = {
        let image = #imageLiteral(resourceName: "twitter-480")
        let imageView = UIImageView(image:image.withTintColor(UIColor.white))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
}
