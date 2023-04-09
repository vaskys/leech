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
    
    var body: some View {
        NavigationStack {
            VStack {
                LogoView()
                Spacer()
                    .frame(height: 100)
                AuthInputView(title: "Input Your Login Info", button_label: "Login",type: 0) {
                    auth.login()
                }
                Spacer()
                    .frame(height: 20)
                Divider()
                
                Text("Login With Socials")
                HStack(spacing: 30) {
                    GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .icon, state: .normal)) {
                        auth.login_google()
                    }
                }
                Spacer()
                    .frame(height: 20)
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
        .alert(auth.error_info, isPresented: $auth.error_show) {}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserAuthVM())
    }
}
