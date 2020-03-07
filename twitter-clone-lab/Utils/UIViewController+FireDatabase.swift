//
//  UIViewController+FireDatabase.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 07/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import FirebaseDatabase

extension UIViewController
{
    var database:DatabaseReference
    {
        Database.database().reference()
    }
}


// MARK: - Users
protocol UsersDatabase
{
    var usersDatabase:DatabaseReference { get }
}

extension UsersDatabase where Self:UIViewController
{
    var usersDatabase:DatabaseReference
    {
        database.child("users")
    }
}

enum UserKey:String
{
    case email = "e"
    case name = "n"
    case user = "u"
}
