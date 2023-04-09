//
//  HomeVIew.swift
//  Leech
//
//  Created by Samo Vaský on 07/04/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: UserAuthVM
    
    var body: some View {
        TabView {
            VStack {
                Text("Welcome \(auth.get_logged_user().email)")
                Text("UID \(auth.get_logged_user().uid)")
            }.tabItem {
                Text("Jedna")
            }
            
            ProfileView()
                .tabItem {
                    Text("Profile")
                }
        }
    }
}

struct HomeVIew_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserAuthVM())
    }
}
