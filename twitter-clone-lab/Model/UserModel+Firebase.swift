//
//  UserModel+Firebase.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 07/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import FirebaseDatabase

extension UserModel
{
    static var database:DatabaseReference
    {
        Database.database().reference().child("users")
    }
    
    func update(completion: @escaping((Error?,DatabaseReference) -> Void))
    {
        UserModel.database.child(uid).updateChildValues(hash, withCompletionBlock: completion)
    }
}
