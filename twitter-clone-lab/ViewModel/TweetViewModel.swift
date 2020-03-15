//
//  TweetViewModel.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 15/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

struct TweetViewModel
{
    let tweet: Tweet
    
    var caption:String
    {
        tweet.caption
    }
    
    var title:NSAttributedString
    {
        let title = NSMutableAttributedString()
        
        guard let user = tweet.user else { return title }
        if let name = user.name {
            title.append(NSAttributedString(string: "\(name) ",
            attributes: [.font : UIFont.boldSystemFont(ofSize: 14)]))
        }
        
        if let user = user.user {
            title.append(NSAttributedString(string: "@\(user)",
            attributes: [.font : UIFont.systemFont(ofSize: 14),
                         .foregroundColor : UIColor.appTheme.lightGray.rgb]))
        }
        
        title.append(NSAttributedString(string: " ﹒\(timestamp)",
            attributes: [.font : UIFont.systemFont(ofSize: 14),
                         .foregroundColor: UIColor.appTheme.lightGray.rgb]))
        
        return title
    }
    
    var pictureURL:URL?
    {
        tweet.user?.pictureURL
    }
    
    var timestamp: String
    {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        
        return formatter.string(from: tweet.timestamp, to: Date()) ?? ""
    }
}
