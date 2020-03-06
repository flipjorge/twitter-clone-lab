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
        view.photoButton.addTarget(self, action: #selector(onPhotoTouch), for: .touchUpInside)
        view.signUpButton.addTarget(self, action: #selector(onSignUpTouch), for: .touchUpInside)
        view.loginButton.addTarget(self, action: #selector(onLoginTouch), for: .touchUpInside)
    }
    
    @objc func onPhotoTouch()
    {
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func onSignUpTouch()
    {
        print("sign up!")
    }
    
    @objc func onLoginTouch()
    {
        navigationController?.popViewController(animated: true)
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
