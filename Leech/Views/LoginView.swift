//
//  LoginView.swift
//  Leech
//
//  Created by Samo Vaský on 05/04/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var user = UserAuthVM()
    
    var body: some View {
        NavigationStack {
            VStack {
                LogoView()
                Spacer()
                    .frame(height: 100)
                AuthInputView(title: "Input Your Login Info", button_label: "Login") {
                    print("BRUH")
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
        .environmentObject(user)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}