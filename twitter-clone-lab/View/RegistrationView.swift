//
//  RegistrationView.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 06/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class RegistrationView: UIView
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
        
        //photo
        addSubview(photoButton)
        photoButton.centerXAnchor(on: self, top: self.safeAreaLayoutGuide.topAnchor, topMargin: 16)
        
        //user
        addSubview(emailField)
        emailField.sizeAnchor(height: 50)
        
        //password
        addSubview(passwordField)
        passwordField.sizeAnchor(height: 50)
        
        //fullname
        addSubview(fullNameField)
        fullNameField.sizeAnchor(height: 50)
        
        //username
        addSubview(emailField)
        emailField.sizeAnchor(height: 50)
        
        //sign up
        addSubview(signUpButton)
        
        //login
        addSubview(loginButton)
        loginButton.centerXAnchor(on: self, bottom: safeAreaLayoutGuide.bottomAnchor, bottomMargin: 16)
        
        //stack
        fieldsStack.addArrangedSubview(emailField)
        fieldsStack.addArrangedSubview(passwordField)
        fieldsStack.addArrangedSubview(fullNameField)
        fieldsStack.addArrangedSubview(usernameField)
        fieldsStack.addArrangedSubview(signUpButton)
        fieldsStack.spacing = 20
        addSubview(fieldsStack)
        fieldsStack.positionAnchor(leading: leadingAnchor, leadingMargin: 16, top: photoButton.bottomAnchor, topMargin: 32, trailing: trailingAnchor, trailingMargin: 16)
    }
    
    
    // MARK: - Photo
    let photoButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        view.sizeAnchor(width: 150, height: 150)
        view.tintColor = .white
        return view
    }()
    
    var userPhoto:UIImage?
    
    func setUserPhoto(_ image: UIImage)
    {
        userPhoto = image
        photoButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        photoButton.contentMode = .scaleAspectFill
        photoButton.layer.cornerRadius = photoButton.bounds.width / 2
        photoButton.layer.masksToBounds = true
        photoButton.layer.borderColor = UIColor.appTheme.white.rgb.cgColor
        photoButton.layer.borderWidth = 3
    }
    
    
    // MARK: - Fields
    let emailField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "envelope")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.keyboardType = .emailAddress
        return view
    }()
    
    let passwordField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "lock")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.isSecureTextEntry = true
        return view
    }()
    
    let fullNameField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "person")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.keyboardType = .alphabet
        return view
    }()
    
    let usernameField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "person")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.keyboardType = .default
        return view
    }()
    
    let fieldsStack: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    
    // MARK: - SignUp
    let signUpButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(UIColor.appTheme.blue.rgb, for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.sizeAnchor(height: 50)
        return view
    }()
    
    
    // MARK: - Login
    let loginButton: UIButton = {
        let view = UIButton(type: .system)
        let title = NSMutableAttributedString(string: "Already have an account?" ,
                                              attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16),
                                                           NSAttributedString.Key.foregroundColor: UIColor.appTheme.white.rgb])
        title.append(NSAttributedString(string: " Log In",
                                        attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16),
                                                                        NSAttributedString.Key.foregroundColor: UIColor.appTheme.white.rgb]))
        view.setAttributedTitle(title, for: .normal)
        return view
    }()
}
