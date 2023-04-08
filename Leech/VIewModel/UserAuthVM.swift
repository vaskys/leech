//
//  UserAuthVM.swift
//  Leech
//
//  Created by Samo Vaský on 08/04/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftUI

@MainActor
final class UserAuthVM: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    var error_info: String = ""
    @Published var error_show: Bool = false
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result,error) in
            guard let e = error else {
                print("Login Succes")
                self.error_show = false
                return
            }
            print(e.localizedDescription)
            self.error_show = true
            self.error_info = e.localizedDescription
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { (result,error) in
            guard let e = error else {
                print("Register Succes")
                self.error_show = false
                return
            }
            print(e.localizedDescription)
            self.error_show = true
            self.error_info = e.localizedDescription
        }
    }
    
    static func get_active_user() -> LUser? {
        guard let user = Auth.auth().currentUser else { return nil }
        return LUser(f_user: user)
    }
    
    func clear() {
        email = ""
        password = ""
    }
    
    
}
