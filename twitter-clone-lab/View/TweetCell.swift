//
//  TweetCell.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 14/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell
{
    // MARK: - Lifecycle
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        setupViews()
    }
    
    
    // MARK: - View
    func setupViews()
    {
        // user picture
        addSubview(userPicture)
        userPicture.positionAnchor(leading: leadingAnchor, leadingMargin: 8, top: safeAreaLayoutGuide.topAnchor, topMargin: 12)
        
        //stack for user name and caption
        let stack = UIStackView(arrangedSubviews: [userNameLabel, captionLabel])
        addSubview(stack)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        stack.alignment = .top
        stack.positionAnchor(leading: userPicture.trailingAnchor, leadingMargin: 8, top: userPicture.topAnchor, trailing: trailingAnchor, trailingMargin: 8)
        
        //line
        addSubview(line)
        line.positionAnchor(leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
        line.sizeAnchor(height: 1)
    }
    
    
    // MARK: - User Picture
    let userPicture: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.sizeAnchor(width: 48, height: 48)
        view.layer.cornerRadius = 48/2
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.appTheme.blue.rgb
        return view
    }()
    
    // MARK: - User Name
    let userNameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14)
        view.text = "Username - @username"
        return view
    }()
    
    // MARK: - Caption
    let captionLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "Caption"
        view.numberOfLines = 0
        return view
    }()
    
    //MARK: - Line
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appTheme.lightGray.rgb
        return view
    }()
    
    // MARK: - Tweet
    var tweet: Tweet?
    {
        didSet
        {
            guard let tweet = self.tweet,
                let user = tweet.user else { return }
            userNameLabel.text = tweet.user?.name
            captionLabel.text = tweet.caption
            
            //picture
            guard let picture = user.pictureURL else { return }
            userPicture.load(from: picture)
        }
    }
}
