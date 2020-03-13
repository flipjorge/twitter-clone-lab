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
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: textField)
    }
    
    
    // MARK: - Setup Views
    func setupViews()
    {
        //background
        backgroundColor = UIColor.appTheme.white.rgb
        
        //user picture
        addSubview(userPicture)
        userPicture.positionAnchor(leading: leadingAnchor, leadingMargin: 16, top: safeAreaLayoutGuide.topAnchor, topMargin: 16)
        
        //placeholder
        addSubview(placeholderLabel)
        placeholderLabel.positionAnchor(leading: userPicture.trailingAnchor, leadingMargin: 12, top: safeAreaLayoutGuide.topAnchor, topMargin: 16)
        
        //text
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: UITextView.textDidChangeNotification, object: textField)
        
        addSubview(textField)
        textField.positionAnchor(leading: userPicture.trailingAnchor, leadingMargin: 8, top: safeAreaLayoutGuide.topAnchor, topMargin: 8, trailing: trailingAnchor, trailingMargin: 8)
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
    
    
    // MARK: - Text Field
    let textField: UITextView = {
        let view = UITextView()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 16)
        view.isScrollEnabled = false
        view.backgroundColor = .rgb(red: 0, green: 0, blue: 0, alpha: 0)
        view.sizeAnchor(height: 300)
        return view
    }()
    
    @objc func textChanged()
    {
        placeholderLabel.isHidden = !textField.text.isEmpty
    }
    
    
    // MARK: - Placeholder
    let placeholderLabel: UILabel = {
        let view = UILabel()
        view.text = "What's happening?"
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = UIColor.appTheme.darkGray.rgb
        return view
    }()
}
