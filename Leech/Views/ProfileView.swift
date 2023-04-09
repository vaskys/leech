//
//  ProfileView.swift
//  Leech
//
//  Created by Samo Vaský on 09/04/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var auth: UserAuthVM
    
    var body: some View {
        VStack {
            Button() {
                Task {
                    try auth.logout()
                }
            } label: {
                Text("Logout")
            }
        }
        .alert(auth.error_info, isPresented: $auth.error_show) {}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserAuthVM())
    }
}
