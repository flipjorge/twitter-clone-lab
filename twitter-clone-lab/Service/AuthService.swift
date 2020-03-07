//
//  AuthService.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 07/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct AuthCredentials
{
    let email: String
    let password: String
    let fullName: String?
    let userName: String?
    let profilePicture: Data?
}

enum AuthError: Error
{
    case userNotLoggedIn, failedGetUserData
    
    var localizedDescription: String
    {
        switch self {
        case .userNotLoggedIn:
            return "User not logged in"
        case .failedGetUserData:
            return "Failed to get user data"
        }
    }
}

class AuthService : ProfilePicturesStorage
{
    static let shared = AuthService()
    
    // MARK: - Register
    func registerUser(_ credentials:AuthCredentials, completion: @escaping((Error?, UserModel?) -> Void))
    {
        //create user
        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { [weak self] result, error in
            
            guard let self = self, let user = result?.user, error == nil else {
                completion(error, nil)
                return
            }
            
            //upload profile picture
            if let profilePicture = credentials.profilePicture
            {
                let imageReference = self.profilePicturesStorage.child(NSUUID().uuidString)
                imageReference.putData(profilePicture, metadata: nil) { metadata, error in
                    guard error == nil else {
                        completion(error, nil)
                        return
                    }
                    
                    //download URL
                    imageReference.downloadURL(completion: { url, error in
                        guard error == nil, let url = url else {
                            completion(error, nil)
                            return
                        }
                        
                        let userData = UserModel(uid: user.uid, email: credentials.email,
                                                 name: credentials.fullName, user: credentials.userName,
                                                 picture: url.absoluteString)
                        
                        userData.update() { error, reference in
                            completion(error, userData)
                        }
                    })
                }
            } else {
                let userData = UserModel(uid: user.uid, email: credentials.email,
                                         name: credentials.fullName, user: credentials.userName,
                                         picture: nil)
                
                userData.update() { error, reference in
                    completion(error, userData)
                }
            }
        }
    }
    
    
    // MARK: - Login
    func getCurrentUser(completion: @escaping((Error?, UserModel?) -> Void))
    {
        guard let user = Auth.auth().currentUser else {
            completion(AuthError.userNotLoggedIn, nil)
            return
        }
        
        //get user data
        UserModel.database.child(user.uid).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? NSDictionary else {
                completion(AuthError.failedGetUserData, nil)
                return
            }
            //
            let userData = UserModel(uid:user.uid,
                                     email:value[UserModel.Key.email.rawValue] as? String,
                                     name:value[UserModel.Key.name.rawValue] as? String,
                                     user:value[UserModel.Key.user.rawValue] as? String,
                                     picture:value[UserModel.Key.picture.rawValue] as? String)
            //
            completion(nil, userData)
        }
    }
    
    func loginUser(_ credentials: AuthCredentials, completion: @escaping((Error?, UserModel?) -> Void))
    {
        Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { result, error in
            guard error == nil, let user = result?.user else {
                completion(error, nil)
                return
            }
            
            //get user data
            UserModel.database.child(user.uid).observeSingleEvent(of: .value) { snapshot in
                guard let value = snapshot.value as? NSDictionary else { return }
                //
                let userData = UserModel(uid:user.uid,
                                         email:value[UserModel.Key.email.rawValue] as? String,
                                         name:value[UserModel.Key.name.rawValue] as? String,
                                         user:value[UserModel.Key.user.rawValue] as? String,
                                         picture:value[UserModel.Key.picture.rawValue] as? String)
                //
                completion(nil, userData)
            }
        }
    }
}
