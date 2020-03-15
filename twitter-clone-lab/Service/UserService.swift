//
//  UserService.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 15/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import FirebaseDatabase

enum UserError: Error
{
    case failedGetUserData
    
    var localizedDescription: String
    {
        switch self {
        case .failedGetUserData:
            return "Failed to get user data"
        }
    }
}

class UserService
{
    static let shared = UserService()
    
    // MARK: - Get user
    func getUser(uid:String, completion:@escaping(Error?, UserModel?) -> Void)
    {
        UserModel.database.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String:Any] else {
                completion(UserError.failedGetUserData, nil)
                return
            }
            
            let user = UserModel(uid: uid, hash: value)
            completion(nil, user)
        }
    }
}
