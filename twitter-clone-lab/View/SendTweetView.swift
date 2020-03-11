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
}
