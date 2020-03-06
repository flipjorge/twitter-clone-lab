//
//  RegistrationViewController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 06/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController
{
    // MARK: - Lifecycle
    override func loadView()
    {
        view = RegistrationView()
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
        guard let view = view as? RegistrationView else { return }
        //
        view.signUpButton.addTarget(self, action: #selector(onSignUpTouch), for: .touchUpInside)
        view.loginButton.addTarget(self, action: #selector(onLoginTouch), for: .touchUpInside)
    }
    
    @objc func onSignUpTouch()
    {
        print("sign up!")
    }
    
    @objc func onLoginTouch()
    {
        navigationController?.popViewController(animated: true)
    }
}
