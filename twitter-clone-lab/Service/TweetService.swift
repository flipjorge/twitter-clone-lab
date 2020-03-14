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
    
    var localizedDescription: String
    {
        switch self {
        case .FailedToSend:
            return "Failed to send"
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
}
