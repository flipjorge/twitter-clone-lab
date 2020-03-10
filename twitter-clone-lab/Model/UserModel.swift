//
//  UserModel.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 07/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import Foundation

struct UserModel
{
    let uid:String
    let email:String?
    let name:String?
    let user:String?
    let picture:String?
    
    var pictureURL: URL?
    {
        guard let picture = picture else { return nil }
        return URL(string: picture)
    }
    
    var hash:Hash
    {
        var hash = Hash()
        //
        if let email = email { hash[Key.email.rawValue] = email }
        if let name = name { hash[Key.name.rawValue] = name }
        if let user = user { hash[Key.user.rawValue] = user }
        if let picture = picture { hash[Key.picture.rawValue] = picture }
        //
        return hash
    }
    
    enum Key:String
    {
        case email = "e"
        case name = "n"
        case user = "u"
        case picture = "pic"
    }
    
    typealias Hash = [AnyHashable:Any]
}
