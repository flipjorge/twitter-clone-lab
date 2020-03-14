//
//  FeedViewController.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 02/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController
{
    // MARK: - Lifecycle
    override func loadView()
    {
        super.loadView()
        //
        view = FeedView()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        guard let view = view as? FeedView else { return }
        navigationItem.titleView = view.logo
        navigationItem.leftBarButtonItem = view.userPictureButton
        
        TweetService.shared.startFeed { [weak self] error, tweet in
            guard error == nil, let tweet = tweet, let self = self else {
                print(error!)
                return
            }
            
            self.tweets.append(tweet)
        }
    }
    
    deinit
    {
        TweetService.shared.stopFeed()
    }
    
    
    // MARK: - User
    var user: UserModel?
    {
        didSet
        {
            guard let view = view as? FeedView else { return }
            guard let user = user else { return }
            guard let pictureURL = user.pictureURL else { return }
            //
            view.userPictureImage.load(from: pictureURL) {
                view.hideUserPicture(animated: false)
                view.showUserPicture()
            }
        }
    }
    
    
    // MARK: - Tweets
    var tweets: [Tweet] = [Tweet]()
}
