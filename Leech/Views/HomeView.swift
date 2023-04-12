//
//  HomeView.swift
//  Leech
//
//  Created by Samo Vaský on 10/04/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeVM()
    @EnvironmentObject var auth: UserAuthVM
    @EnvironmentObject var alerty: Alert
   
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                VStack {
                    ForEach(homeVM.videos) { video in
                        NavigationLink {
                            YouTubeView(id: video.video_id)
                        } label: {
                            Text(video.video_id)
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            homeVM.get_videos { (msg: String) in
                alerty.pop_alert(msg: msg)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
