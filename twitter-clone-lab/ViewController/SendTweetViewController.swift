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
    }
    
    
    // MARK: - Actions
    @objc func onCancelTouch()
    {
        dismiss(animated: true, completion: nil)
    }
}
