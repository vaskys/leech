//
//  RootView.swift
//  Leech
//
//  Created by Samo Vaský on 12/04/2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home",systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
