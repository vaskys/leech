//
//  RootView.swift
//  Leech
//
//  Created by Samo Vaský on 12/04/2023.
//

import SwiftUI

struct RootView: View {
    @StateObject var inv_api = IApi()
    @EnvironmentObject var alerty: Alert
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Domov",systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Hľadaj", systemImage: "magnifyingglass")
                }
           
            LibView()
                .tabItem {
                    Label("Knižnica", systemImage: "folder")
                }
            ProfileView()
                .tabItem {
                    Label("Nastavenia", systemImage: "gear")
                }
        }
        .tableStyle(.inset)
        .environmentObject(inv_api)
        .sheet(isPresented: $inv_api.present_video) {
            VideoView()
                .environmentObject(inv_api)
                .environmentObject(alerty)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
