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
        addSubview(usernameField)
        usernameField.sizeAnchor(height: 50)
        
        //status
        addSubview(statusField)
        statusField.font = UIFont.systemFont(ofSize: 12)
        statusField.text = "Status code"
        statusField.isHidden = true
        statusField.sizeAnchor(height: 20)
        
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
        fieldsStack.addArrangedSubview(statusField)
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
    
    let fullNameField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "person")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.keyboardType = .alphabet
        view.textView.autocapitalizationType = .words
        return view
    }()
    
    let usernameField: InputFieldView = {
        let view = InputFieldView()
        view.iconView.image = UIImage(systemName: "person")
        view.textView.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        view.textView.keyboardType = .default
        view.textView.autocapitalizationType = .none
        return view
    }()
    
    let fieldsStack: UIStackView = {
        let view = UIStackView()
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
    
    func startWorkInProgress()
    {
        signUpButton.isEnabled = false
        signUpButton.setTitle("Signing up...", for: .normal)
        signUpButton.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 180)
    }
    
    func stopWorkInProgress()
    {
        signUpButton.isEnabled = true
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .white
    }
    
    
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
