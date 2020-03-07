//
//  DatabaseProtocol.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 07/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import FirebaseStorage


// MARK: - Storage
protocol StorageProtocol
{
    var storage:StorageReference { get }
}

extension StorageProtocol
{
    var storage:StorageReference
    {
        Storage.storage().reference()
    }
}


// MARK: - Profile Picture
protocol ProfilePicturesStorage:StorageProtocol
{
    var profilePicturesStorage:StorageReference { get }
}

extension ProfilePicturesStorage
{
    var profilePicturesStorage:StorageReference
    {
        storage.child("profile_pictures")
    }
}
