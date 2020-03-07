//
//  RegistrationViewController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 06/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegistrationViewController: UIViewController, UsersDatabase, ProfilePicturesStorage
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
        setupDelegates()
        setupActions()
    }
    
    
    // MARK: - Delegates
    func setupDelegates()
    {
        guard let view = view as? RegistrationView else { return }
        //
        view.emailField.textView.delegate = self
        view.passwordField.textView.delegate = self
        view.fullNameField.textView.delegate = self
        view.usernameField.textView.delegate = self
    }
    
    
    // MARK: - Actions
    func setupActions()
    {
        guard let view = view as? RegistrationView else { return }
        //
        view.addEndEditingOnTap()
        view.photoButton.addTarget(self, action: #selector(onPhotoTouch), for: .touchUpInside)
        view.signUpButton.addTarget(self, action: #selector(onSignUpTouch), for: .touchUpInside)
        view.loginButton.addTarget(self, action: #selector(onLoginTouch), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardChange), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func onPhotoTouch()
    {
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func onSignUpTouch()
    {
        signUp()
    }
    
    @objc func onLoginTouch()
    {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onKeyboardChange(notification: Notification)
    {
        view.frame.origin.y = notification.name == UIResponder.keyboardWillChangeFrameNotification ? -120 : 0
    }
    
    
    // MARK: - Photo Picker
    lazy var photoPicker:UIImagePickerController = {
        let view = UIImagePickerController()
        view.allowsEditing = true
        view.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        view.sourceType = .photoLibrary
        view.delegate = self
        return view
    }()
    
    
    // MARK: - SignUp
    func signUp()
    {
        guard let view = view as? RegistrationView else { return }
        //check image
        guard let profileImage = view.userPhoto else {
            print("profile image required!")
            return
        }
        
        //create user
        Auth.auth().createUser(withEmail: view.emailField.inputValue, password: view.passwordField.inputValue) { [weak self] result, error in
            guard let user = result?.user, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            //upload profile picture
            guard let jpegData = profileImage.jpegData(compressionQuality: 0.3) else { return }
            let imageReference = self?.profilePicturesStorage.child(NSUUID().uuidString)
            imageReference?.putData(jpegData, metadata: nil) { (metadata, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                //download URL
                imageReference?.downloadURL(completion: { url, error in
                    guard error == nil, let url = url else {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    //store user data
                    let userHash: [AnyHashable:Any] = [UserKey.email.rawValue:view.emailField.inputValue,
                                                       UserKey.name.rawValue:view.fullNameField.inputValue,
                                                       UserKey.user.rawValue:view.usernameField.inputValue,
                                                       UserKey.picture.rawValue:url.absoluteString]
                    
                    self?.usersDatabase.child(user.uid).updateChildValues(userHash) { error, reference in
                        guard error == nil else {
                            print(error!.localizedDescription)
                            return
                        }
                        
                        print("success!")
                    }
                })
            }
        }
    }
}

// MARK: - Image Picker Delegates
extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        guard let view = view as? RegistrationView else { return }
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        //
        view.setUserPhoto(image)
        //
        dismiss(animated: true, completion: nil)
    }
}

extension RegistrationViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        guard let view = view as? RegistrationView else { return true }
        //
        switch textField
        {
        case view.emailField.textView:
            view.passwordField.textView.becomeFirstResponder()
        case view.passwordField.textView:
            view.fullNameField.textView.becomeFirstResponder()
        case view.fullNameField.textView:
            view.usernameField.textView.becomeFirstResponder()
        case view.usernameField.textView:
            signUp()
            textField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
}
