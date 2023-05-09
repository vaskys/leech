//
//  LoginView.swift
//  Leech
//
//  Created by Samo Vaský on 05/04/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    @EnvironmentObject var auth: UserAuthVM
    @EnvironmentObject var alerty: Alert
    
    var body: some View {
        NavigationStack {
            VStack {
                LogoView()
                    .padding(.bottom)
                AuthInputView(title: "Input Your Login Info", button_label: "Login",type: 0) {
                    auth.login { (msg: String) in
                        alerty.pop_alert(msg: msg)
                    }
                }
                Divider()
                
                Text("Login With Socials")
                HStack(spacing: 20) {
                    GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .icon, state: .normal)) {
                        auth.login_google { (msg: String) in
                            alerty.pop_alert(msg: msg)
                        }
                    }
                }
                Divider()
               
                HStack {
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Create Account")
                            .font(.headline)
                    }
                    Divider()
                        .frame(maxHeight: 20)
                    
                    NavigationLink {
                        ResetPasword()
                    } label: {
                        Text("Forgot Password")
                            .font(.headline)
                    }
                }
                    
            }
            .padding()
        }
        .onAppear {
            auth.login_current_user()
        }
        .environmentObject(auth)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserAuthVM())
    }
}
