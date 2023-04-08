//
//  AuthManager.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import Foundation
import FirebaseAuth

final class AuthManger {
    
    static let manager = AuthManger()
    
    private init() {
        
    }
    
    func register(email: String, password: String) async throws -> LUser {
        let auth_result = try await Auth.auth().createUser(withEmail: email, password: password)
        return LUser(f_user: auth_result.user)
    }
    
    func get_active_user() -> LUser {
        return LUser(f_user: Auth.auth().currentUser!)
    }
}
