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
                
                 Button {
                let url = URL(string: "https://youtube.googleapis.com/youtube/v3/subscriptions?part=snippet&mine=true&key=AIzaSyAXQRc8OlWQf_fKuuE4bNpa72XviTNeUUI&access_token=\(auth.get_logged_user().g_acces_token)")!

                     
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    guard let data = data else { return }
                    print(String(data: data, encoding: .utf8)!)
                }

                task.resume()
                     print("OK")
                     print(auth.get_logged_user().g_acces_token)
            } label: {
                Text("HTTP")
            }
            }.tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }
            .multilineTextAlignment(.center)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            
           
        }
        .background(Color.red)
        .tabViewStyle(.automatic)
        .onAppear {
            

        }
    }
}

struct HomeVIew_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserAuthVM())
    }
}
