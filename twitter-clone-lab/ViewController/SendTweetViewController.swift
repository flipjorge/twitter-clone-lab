//
//  SendTweetViewController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 10/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class SendTweetViewController: UIViewController
{

    // MARK: - Lifecycle
    init(user: UserModel)
    {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView()
    {
        super.loadView()
        view = SendTweetView()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupViews()
    }
    
    
    // MARK: - Setup View
    func setupViews()
    {
        guard let view = view as? SendTweetView else { return }
        //
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        //
        navigationItem.leftBarButtonItem = view.cancelButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view.tweetButton)
        //
        view.cancelButton.target = self
        view.cancelButton.action = #selector(onCancelTouch)
        //
        guard let pictureURL = user.pictureURL else { return }
        view.userPicture.load(from: pictureURL) {
            view.hideUserPicture(animated: false)
            view.showUserPicture()
        }
    }
    
    
    // MARK: - Actions
    @objc func onCancelTouch()
    {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - User
    let user: UserModel
}
