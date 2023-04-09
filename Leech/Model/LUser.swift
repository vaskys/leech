//
//  User.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

final class LUser {
    let uid: String
    let email: String
    
    let g_acces_token: String?
    let g_id_token: String?
    
    init(f_user: User) {
        self.uid = f_user.uid
        self.email = f_user.email ?? "no@email.xD"
        
        self.g_id_token = "no_g_account"
        self.g_acces_token = "no_g_account"
    }
    
    init() {
        self.email = "no user logged in "
        self.uid = "-1"
        self.g_id_token = "no_g_account"
        self.g_acces_token = "no_g_account"
    }
    
    
    
}

