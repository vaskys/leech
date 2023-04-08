//
//  User.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import Foundation
import FirebaseAuth


final class LUser {
    
    
    let uid: String
    let email: String?
    var logged_in: Bool
    
    init(f_user: User) {
        self.uid = f_user.uid
        self.email = f_user.email
        self.logged_in = false
    }
    
    init() {
        self.email = "not logged in"
        self.uid = "-1"
        self.logged_in = false
    }
}

