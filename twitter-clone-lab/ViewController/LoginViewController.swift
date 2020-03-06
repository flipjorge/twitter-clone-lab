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
    // MARK: - Lifecycle
    override func loadView()
    {
        view = LoginView()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        setupActions()
    }
    
    
    // MARK: - Actions
    func setupActions()
    {
        guard let view = view as? LoginView else { return }
        //
        view.loginButton.addTarget(self, action: #selector(onLoginTouch), for: .touchUpInside)
        view.signUpButton.addTarget(self, action: #selector(onSignUpTouch), for: .touchUpInside)
    }
    
    @objc func onLoginTouch()
    {
        print("login!")
    }
    
    @objc func onSignUpTouch()
    {
        let registrationViewController = RegistrationViewController()
        //
        navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
}
