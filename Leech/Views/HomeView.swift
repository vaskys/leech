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
    
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: true){
                VStack(spacing: 0) {
                    ForEach(homeVM.videos) { video in
                        NavigationLink {
                            YouTubeView(id: video.videoId)
                        } label: {
                            VStack {
                                AImageView(url_string: video.videoThumbnails[0].url,overlay_string: video.viewCount.description)
                                Text(video.title)
                                    .font(.title3)
                                    .scaledToFit()
                                HStack {
                                    Text(video.author)
                                    Text("Views \(video.viewCount.description)")
                                }
                            }
                            .padding()
                        }
                        
                    }
                }
            }
            .navigationTitle("Trending")
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
            .environmentObject(Alert())
            .environmentObject(UserAuthVM())
    }
}
