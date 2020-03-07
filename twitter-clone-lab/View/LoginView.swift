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
    // MARK: - Initializers
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
        addSubview(emailField)
        emailField.sizeAnchor(height: 50)
        
        //password
        addSubview(passwordField)
        passwordField.sizeAnchor(height: 50)
        
        //status
        addSubview(statusField)
        statusField.font = UIFont.systemFont(ofSize: 12)
        statusField.text = "Status code"
        statusField.isHidden = true
        statusField.sizeAnchor(height: 20)
        
        //login
        addSubview(loginButton)
        
        //sign up
        addSubview(signUpButton)
        signUpButton.centerXAnchor(on: self, bottom: safeAreaLayoutGuide.bottomAnchor, bottomMargin: 16)
        
        //stack
        fieldsStack.addArrangedSubview(emailField)
        fieldsStack.addArrangedSubview(passwordField)
        fieldsStack.addArrangedSubview(statusField)
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
    let emailField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "envelope")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.keyboardType = .emailAddress
        view.textView.autocapitalizationType = .none
        return view
    }()
    
    let passwordField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "lock")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.isSecureTextEntry = true
        view.textView.autocapitalizationType = .none
        return view
    }()
    
    let fieldsStack: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    
    // MARK: - Status
    let statusField: UITextField = {
        let view = UITextField()
        view.textColor = .white
        return view
    }()
    
    func showStatus(_ message:String)
    {
        statusField.text = message
        statusField.isHidden = false
    }
    
    func hideStatus()
    {
        statusField.isHidden = true
    }
    
    
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
    
    func startWorkInProgress()
    {
        loginButton.isEnabled = false
        loginButton.setTitle("Logging in...", for: .normal)
        loginButton.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 180)
    }
    
    func stopWorkInProgress()
    {
        loginButton.isEnabled = true
        loginButton.setTitle("Log In", for: .normal)
        loginButton.backgroundColor = .white
    }
    
    
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
