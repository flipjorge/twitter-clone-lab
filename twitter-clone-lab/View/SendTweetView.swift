//
//  SendTweetView.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 10/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class SendTweetView: UIView
{
    // MARK: - Lifecycle
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
        backgroundColor = UIColor.appTheme.white.rgb
        
        //user picture
        addSubview(userPicture)
        userPicture.positionAnchor(leading: leadingAnchor, leadingMargin: 16, top: safeAreaLayoutGuide.topAnchor, topMargin: 16)
    }
    
    
    // MARK: - Tweet
    let tweetButton: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.system)
        view.backgroundColor = UIColor.appTheme.blue.rgb
        view.setTitle("Tweet", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        view.layer.cornerRadius = 32/2
        view.sizeAnchor(width: 64, height: 32)
        return view
    }()
    
    
    // MARK: - Cancel
    let cancelButton: UIBarButtonItem = {
        let view = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: nil)
        view.tintColor = .gray
        return view
    }()
    
    
    // MARK: - User Picture
    let userPicture: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.sizeAnchor(width: 48, height: 48)
        view.layer.cornerRadius = 48/2
        view.layer.masksToBounds = true
        return view
    }()
    
    func showUserPicture(animated: Bool = true)
    {
        if animated {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: .curveEaseInOut, animations: { [weak self] in
                self?.userPicture.alpha = 1
            })
        } else {
            userPicture.alpha = 1
        }
    }
    
    func hideUserPicture(animated: Bool = true)
    {
        if animated {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
                [weak self] in
                self?.userPicture.alpha = 0
            })
        } else {
            userPicture.alpha = 0
        }
    }
}
