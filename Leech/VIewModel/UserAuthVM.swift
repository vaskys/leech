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
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error_show: Bool = false
    
    @Published var logged_user: LUser?
    
    var error_info: String = ""
   
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result,error) in
            guard let e = error else {
                print("Login Succes")
                self.login_current_user()
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
                self.login()
                return
            }
            print(e.localizedDescription)
            self.error_show = true
            self.error_info = e.localizedDescription
        }
    }
    
    func login_current_user() {
        guard let user = Auth.auth().currentUser else { return }
        logged_user = LUser(f_user: user)
        
    }
    func get_logged_user() -> LUser {
        guard let user = logged_user else {
            print("No User Logged In Return Empty User")
            return LUser()
        }
        return user
    }
    
    func clear() {
        email = ""
        password = ""
    }
    
    
    @ViewBuilder var view_selector: some View {
        if self.logged_user != nil {
           HomeView()
        } else {
            LoginView()
        }
    }
    
}
