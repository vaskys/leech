//
//  HomeView.swift
//  Leech
//
//  Created by Samo Vaský on 10/04/2023.
//
import SwiftUI
import WebKit

struct HomeView: View {
    @EnvironmentObject var inv_api: IApi
    @EnvironmentObject var auth: UserAuthVM
    @EnvironmentObject var alerty: Alert
    
    var body: some View {
        NavigationStack() {
            ScrollView(.vertical,showsIndicators: true){
                VStack(spacing: 0) {
                    ForEach(inv_api.videos) { video in
                        NavigationLink {
                            VideoView(video: video)
                        } label: {
                            VStack {
                                AImageView(url_string: video.t_medium,overlay_string: video.duration, width: nil, height: 250, max_width: nil,max_height: nil)
                                Text(video.title)
                                    .font(.title3)
                                    .scaledToFit()
                                HStack {
                                    Text(video.autor)
                                    Text("Views \(video.views)")
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
            inv_api.get_trending_videos { (msg:String) in
                alerty.pop_alert(msg: msg)
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//            .environmentObject(Alert())
//            .environmentObject(UserAuthVM())
//    }
//}
