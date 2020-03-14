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
    let uid:String
    let caption:String
    let timestamp:Date = Date()
    let likes:Int = 0
    let retweets:Int = 0
    
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
