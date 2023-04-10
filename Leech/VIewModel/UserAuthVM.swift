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
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class UserAuthVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var password_check: String = ""
    @Published var alert_show: Bool = false
    
    @Published var logged_user: LUser?
    
    var alert_msg: String = ""
   
    func login_google() {
        Task {
            do {
                guard let top = UIApplication.topViewController() else { return }
                let gid_result = try await GIDSignIn.sharedInstance.signIn(withPresenting: top, hint: "", additionalScopes: ["https://www.googleapis.com/auth/youtube.readonly","https://www.googleapis.com/auth/youtube","https://www.googleapis.com/auth/youtube.force-ssl"])
                guard let id_token: String = gid_result.user.idToken?.tokenString else { return }
                let acces_token: String = gid_result.user.accessToken.tokenString
                let credentials = GoogleAuthProvider.credential(withIDToken: id_token, accessToken: acces_token)
                //pridaj google profile udaje
                print("LULE")
                print("acces token \(acces_token) \n")
                print("id token \(id_token) \n")
                
                try await Auth.auth().signIn(with: credentials)
                self.login_current_user()
                
            } catch {
                print(error.localizedDescription)
                self.alert_show = true
                self.alert_msg = error.localizedDescription
            }
        }
    }
    
    func login() {
        Task {
            do {
                try await Auth.auth().signIn(withEmail: email, password: password)
                self.login_current_user()
            } catch {
                print(error)
                self.alert_show = true
                self.alert_msg = error.localizedDescription
            }
        }
    }
    
    func register() {
        if self.password != self.password_check {
            self.alert_msg = "password dont match"
            self.alert_show = true
            self.clear()
            return
        }
        Task {
            do {
                try await Auth.auth().createUser(withEmail: email, password: password)
                self.login()
            } catch {
                print(error.localizedDescription)
                self.alert_show = true
                self.alert_msg = error.localizedDescription
            }
        }
    }
    
    func login_current_user()  {
        guard let user = Auth.auth().currentUser else { return }
        
        var g_access_token:String = ""
        Task {
            do {
                try await GIDSignIn.sharedInstance.restorePreviousSignIn()
                g_access_token = GIDSignIn.sharedInstance.currentUser!.accessToken.tokenString
            } catch {
                print(error.localizedDescription)
            }
            logged_user = LUser(f_user: user,token: g_access_token)
        }
    }
    
    func get_logged_user() -> LUser {
        guard let user = logged_user else {
            return LUser()
        }
        return user
    }
    
    func logout() throws {
        do {
            GIDSignIn.sharedInstance.signOut()
            try Auth.auth().signOut()
            logged_user = nil
        } catch {
            print(error.localizedDescription)
            self.alert_show = true
            self.alert_msg = error.localizedDescription
        }
    }
    
    func reset_password() {
        Task {
            do {
                try await Auth.auth().sendPasswordReset(withEmail: email)
                self.alert_show = true
                self.alert_msg = "Recovery Link na Email"
                
            } catch {
                print(error.localizedDescription)
                self.alert_show = true
                self.alert_msg = error.localizedDescription
            }
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
