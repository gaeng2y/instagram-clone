//
//  ProfileHeaderViewModel.swift
//  InstagramFirebaseTutorial
//
//  Created by gaeng on 2022/08/15.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    
    var profileImageUrl: String {
        return user.profileImageUrl
    }
    
    init(user: User) {
        self.user = user
    }
}
