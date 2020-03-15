//
//  Tweet.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 13/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import Foundation

struct Tweet
{
    let tid:String?
    let uid:String
    let caption:String
    let timestamp:Date
    let likes:Int
    let retweets:Int
    let user:UserModel?
    
    init(uid:String, caption:String)
    {
        self.tid = nil
        self.uid = uid
        self.caption = caption
        self.timestamp = Date()
        self.likes = 0
        self.retweets = 0
        self.user = nil
    }
    
    init(user:UserModel, tid:String, hash:[String:Any])
    {
        self.tid = tid
        self.uid = hash[Key.uid.rawValue] as? String ?? ""
        self.caption = hash[Key.caption.rawValue] as? String ?? ""
        self.likes = hash[Key.likes.rawValue] as? Int ?? 0
        self.retweets = hash[Key.retweets.rawValue] as? Int ?? 0
        self.user = user
        
        if let timestampValue = hash[Key.timestamp.rawValue] as? TimeInterval {
            self.timestamp = Date(timeIntervalSince1970: timestampValue/1000)
        } else {
            self.timestamp = Date()
        }
    }
    
    var hash:Hash
    {
        var hash = Hash()
        //
        hash[Key.uid.rawValue] = uid
        hash[Key.caption.rawValue] = caption
        hash[Key.timestamp.rawValue] = timestamp.timeIntervalSince1970
        hash[Key.likes.rawValue] = likes
        hash[Key.retweets.rawValue] = retweets
        //
        return hash
    }
    
    enum Key:String
    {
        case uid = "uid"
        case caption = "c"
        case timestamp = "t"
        case likes = "l"
        case retweets = "rt"
    }
    
    typealias Hash = [String:Any]
}
