//
//  UserService.swift
//  InstagramFirebaseTutorial
//
//  Created by gaeng on 2022/08/15.
//

import Firebase

struct UserService {
    static func fetchUser(completion: @escaping (User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        CollectionUsers.document(uid).getDocument { snapshot, error in
//            print("DEBUG: Snapshot is \(snapshot?.data())")
            guard let dictionary = snapshot?.data() else { return }
            let user = User.init(dictionary)
            completion(user)
        }
    }
}
