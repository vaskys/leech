//
//  User.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import Foundation
import FirebaseAuth

struct LUser {
    let uid: String
    let email: String?
    
    init(f_user: User) {
        self.uid = f_user.uid
        self.email = f_user.email
    }
}
