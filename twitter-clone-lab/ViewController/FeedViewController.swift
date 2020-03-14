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
        setupCollectionView()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        setupViews()
        //
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
    
    
    // MARK: - Views
    func setupViews()
    {
        guard let view = view as? FeedView else { return }
        navigationItem.titleView = view.logo
        navigationItem.leftBarButtonItem = view.userPictureButton
        view.collectionView.backgroundColor = .white
    }
    
    
    // MARK: - Collection
    func setupCollectionView()
    {
        guard let view = view as? FeedView else { return }
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        view.collectionView.register(TweetCell.self, forCellWithReuseIdentifier: tweetCellIdentifier)
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


// MARK: - Data Source
fileprivate let tweetCellIdentifier = "tweetCell"

extension FeedViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tweetCellIdentifier, for: indexPath)
        return cell
    }
}


// MARK: - Delegate
extension FeedViewController: UICollectionViewDelegate
{
    
}


extension FeedViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: 200)
    }
}
