//
//  LoginView.swift
//  Leech
//
//  Created by Samo Vaský on 05/04/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var user = UserAuthVM()
    @Binding var logged_in: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                LogoView()
                Spacer()
                    .frame(height: 100)
                AuthInputView(title: "Input Your Login Info", button_label: "Login") {
                    user.login()
                }
                Spacer()
                    .frame(height: 20)
                Divider()
                
                Text("Login With Socials")
                HStack(spacing: 30) {
                    Image(systemName: "circle.fill")
                        .size(width_i: 50, height_i: 50)
                    Image(systemName: "circle.fill")
                        .size(width_i: 50, height_i: 50)
                    Image(systemName: "circle.fill")
                        .size(width_i: 50, height_i: 50)
                }
                Spacer()
                    .frame(height: 20)
                Divider()
                
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Create Account")
                        .font(.headline)
                }
            }
            .padding()
        }
        .onAppear {
           //
        }
        .environmentObject(user)
        .alert(user.error_info, isPresented: $user.error_show) {}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(logged_in: .constant(false))
    }
}
