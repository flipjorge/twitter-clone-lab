//
//  TweetService.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 13/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import FirebaseDatabase

enum TweetError: Error
{
    case FailedToSend
    case FailedToFetchTweets
    
    var localizedDescription: String
    {
        switch self {
        case .FailedToSend:
            return "Failed to send"
        case .FailedToFetchTweets:
            return "Failed to fetch tweets"
        }
    }
}

class TweetService
{
    static let shared = TweetService()
    
    // MARK: - Send
    func sendTweet(_ caption:String, byUID uid:String, completion: ((Error?, Tweet?) -> Void)? = nil )
    {
        let tweet = Tweet(uid: uid, caption: caption)
        
        tweet.update { error, reference in
            if let completion = completion { completion(error, tweet) }
        }
    }
    
    
    // MARK: - Feed
    var feedObserve:DatabaseHandle?
    
    func startFeed(completion: @escaping(Error?, Tweet?) -> Void)
    {
        stopFeed()
        //
        feedObserve = Tweet.database.observe(.childAdded) { snapshot in
            guard let value = snapshot.value as? [String:Any] else {
                completion(TweetError.FailedToFetchTweets, nil)
                return
            }
            
            let tweet = Tweet(tid: snapshot.key, hash: value)
            completion(nil, tweet)
        }
    }
    
    func stopFeed()
    {
        guard let observer = feedObserve else { return }
        Tweet.database.removeObserver(withHandle: observer)
    }
}
