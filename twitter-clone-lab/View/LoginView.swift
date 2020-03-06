//
//  LoginView.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 06/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class LoginView: UIView
{
    // MARK - Initializers
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        setupViews()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupViews()
    }
    
    
    // MARK: - Setup Views
    func setupViews()
    {
        //background
        backgroundColor = UIColor.appTheme.blue.rgb
        
        //icon
        addSubview(logo)
        logo.centerXAnchor(on: self, top: safeAreaLayoutGuide.topAnchor)
        logo.sizeAnchor(width: 150, height: 150)
        
        //user
        addSubview(userField)
        userField.sizeAnchor(height: 50)
        
        //password
        addSubview(passwordField)
        passwordField.sizeAnchor(height: 50)
        
        //login
        addSubview(loginButton)
        
        //sign up
        addSubview(signUpButton)
        signUpButton.centerXAnchor(on: self, bottom: safeAreaLayoutGuide.bottomAnchor, bottomMargin: 16)
        
        //stack
        fieldsStack.addArrangedSubview(userField)
        fieldsStack.addArrangedSubview(passwordField)
        fieldsStack.addArrangedSubview(loginButton)
        fieldsStack.spacing = 20
        addSubview(fieldsStack)
        fieldsStack.positionAnchor(leading: leadingAnchor, leadingMargin: 16, top: logo.bottomAnchor, topMargin: 32, trailing: trailingAnchor, trailingMargin: 16)
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
    
    
    // MARK: - Login
    let loginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Log In", for: .normal)
        view.setTitleColor(UIColor.appTheme.blue.rgb, for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.sizeAnchor(height: 50)
        return view
    }()
    
    
    // MARK: - SignUp
    let signUpButton: UIButton = {
        let view = UIButton(type: .system)
        let title = NSMutableAttributedString(string: "Don't have an account?" ,
                                              attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16),
                                                           NSAttributedString.Key.foregroundColor: UIColor.appTheme.white.rgb])
        title.append(NSAttributedString(string: " Sign up",
                                        attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16),
                                                                        NSAttributedString.Key.foregroundColor: UIColor.appTheme.white.rgb]))
        view.setAttributedTitle(title, for: .normal)
        return view
    }()
}
