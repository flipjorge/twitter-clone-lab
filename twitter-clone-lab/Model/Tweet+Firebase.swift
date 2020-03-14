//
//  Tweet+Firebase.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 13/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import FirebaseDatabase

extension Tweet
{
    static var database:DatabaseReference
    {
        Database.database().reference().child("tweets")
    }
    
    func update(completion: @escaping((Error?, DatabaseReference) -> Void))
    {
        var modifiedHash = hash
        modifiedHash[Key.timestamp.rawValue] = ServerValue.timestamp()
        //
        Tweet.database.childByAutoId().updateChildValues(modifiedHash, withCompletionBlock: completion)
    }
}
