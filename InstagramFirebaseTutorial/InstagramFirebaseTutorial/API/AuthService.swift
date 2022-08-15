//
//  AuthService.swift
//  InstagramFirebaseTutorial
//
//  Created by gaeng on 2022/08/15.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let passwrod: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static func registerUser(withCredential credentails: AuthCredentials, completion: @escaping (Error?) -> Void) {
        ImageUploader.uploadImage(image: credentails.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentails.email, password: credentails.passwrod) { result, error in
                if let error = error {
                    print("DEBUG: Failed to register user \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data: [String: Any] = ["email": credentails.email,
                                           "fullname": credentails.fullname,
                                           "profileImageUrl": imageUrl,
                                           "uid": uid,
                                           "username": credentails.username]
                
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
        }
    }
}
