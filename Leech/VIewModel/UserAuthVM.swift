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
    @Published var password_check: String = ""
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
        if self.password != self.password_check {
            self.error_info = "password dont match"
            self.error_show = true
            self.clear()
            return
        }
        
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
            return LUser()
        }
        return user
    }
    
    func logout() throws {
        do {
            try Auth.auth().signOut()
            logged_user = nil
        } catch {
            print(error.localizedDescription)
            self.error_show = true
            self.error_info = error.localizedDescription
        }
    }
    
    func reset_password() {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            guard let e = error else {
                print("reset succes")
                self.error_show = true
                self.error_info = "Reset Succes Check Your Email "
                return
            }
            print(e.localizedDescription)
            self.error_show = true
            self.error_info = e.localizedDescription
        }
    }
    
    func clear() {
        email = ""
        password = ""
        password_check = ""
    }
    
    
    @ViewBuilder var view_selector: some View {
        if self.logged_user != nil {
           HomeView()
        } else {
            LoginView()
        }
    }
    
}
