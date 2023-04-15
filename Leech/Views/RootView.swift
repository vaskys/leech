//
//  RootView.swift
//  Leech
//
//  Created by Samo Vaský on 12/04/2023.
//

import SwiftUI

struct RootView: View {
    @StateObject var inv_api = IApi()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home",systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            ProfileView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .environmentObject(inv_api)
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
