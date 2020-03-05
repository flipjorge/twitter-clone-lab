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
        
        //user
        view.addSubview(userField)
        userField.sizeAnchor(height: 50)
        
        //password
        view.addSubview(passwordField)
        passwordField.sizeAnchor(height: 50)
        
        //stack
        fieldsStack.addArrangedSubview(userField)
        fieldsStack.addArrangedSubview(passwordField)
        view.addSubview(fieldsStack)
        fieldsStack.positionAnchor(leading: view.leadingAnchor, leadingMargin: 16, top: logo.bottomAnchor, topMargin: 32, trailing: view.trailingAnchor, trailingMargin: 16)
    }
    
    
    // MARK: - Icon
    let logo: UIImageView = {
        let image = #imageLiteral(resourceName: "twitter-480")
        let imageView = UIImageView(image:image.withTintColor(UIColor.white))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // MARK: - Fields
    let userField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "envelope")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        return view
    }()
    
    let passwordField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "lock")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.isSecureTextEntry = true
        return view
    }()
    
    let fieldsStack: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
}
