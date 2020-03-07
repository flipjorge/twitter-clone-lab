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
        setupDelegates()
        setupActions()
    }
    
    
    // MARK: - Delegates
    var delegate:LoginViewControllerDelegate?
    
    func setupDelegates()
    {
        guard let view = view as? LoginView else { return }
        //
        view.emailField.textView.delegate = self
        view.passwordField.textView.delegate = self
    }
    
    
    // MARK: - Actions
    func setupActions()
    {
        guard let view = view as? LoginView else { return }
        //
        view.addEndEditingOnTap()
        view.loginButton.addTarget(self, action: #selector(onLoginTouch), for: .touchUpInside)
        view.signUpButton.addTarget(self, action: #selector(onSignUpTouch), for: .touchUpInside)
    }
    
    @objc func onLoginTouch()
    {
        view.endEditing(true)
        logIn()
    }
    
    @objc func onSignUpTouch()
    {
        let registrationViewController = RegistrationViewController()
        registrationViewController.delegate = self
        //
        navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
    
    // MARK: - LogIn
    func logIn()
    {
        guard let view = view as? LoginView else { return }
        //
        let credentials = AuthCredentials(email: view.emailField.inputValue, password: view.passwordField.inputValue, fullName: nil, userName: nil, profilePicture: nil)
        //
        AuthService.shared.loginUser(credentials) { error, user in
            guard error == nil, let user = user else {
                print(error!.localizedDescription)
                view.showStatus(error?.localizedDescription ?? "Failed to login user")
                view.stopWorkInProgress()
                return
            }
            //
            guard let delegate = self.delegate else {
                view.showStatus("Login View needs a delegate to dismiss")
                view.stopWorkInProgress()
                return
            }
            //
            delegate.loginViewControllerLoggedIn(viewController: self, user: user)
        }
        //
        view.startWorkInProgress()
    }
    
}


// MARK: - Text Field Delegates
extension LoginViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        guard let view = view as? LoginView else { return true }
        //
        if textField === view.emailField.textView
        {
            view.passwordField.textView.becomeFirstResponder()
        } else {
            logIn()
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        guard let view = view as? RegistrationView else { return }
        //
        view.hideStatus()
    }
}


// MARK: - Registration Delegate
extension LoginViewController: RegistrationViewControllerDelegate
{
    func registrationViewControllerSignedUp(viewController: RegistrationViewController, user: UserModel)
    {
        guard let delegate = delegate else { return }
        //
        delegate.loginViewControllerLoggedIn(viewController: self, user: user)
    }
}


// MARK: - Login View Protocol
protocol LoginViewControllerDelegate
{
    func loginViewControllerLoggedIn(viewController:LoginViewController, user:UserModel)
}
