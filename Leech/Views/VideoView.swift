//
//  VideoView.swift
//  Leech
//
//  Created by Samo Vaský on 06/04/2023.
//

import SwiftUI
import WebKit

struct EmbedVideoView: UIViewRepresentable {
    let id:String
    
    func makeUIView(context: Context) ->  WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        webView.scrollView.isScrollEnabled = false
           return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let video_url = URL(string: "https://invidious.snopyta.org/embed/\(id)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: video_url))
    }
}



struct VideoView: View {
    @EnvironmentObject var inv_api: IApi
    @ObservedObject var video: Video
    
    var body: some View {
        VStack {
            EmbedVideoView(id: video.video_id)
                .frame(width:420,height: 300)
            HStack {
                Text(video.autor)
                Text("Views \(video.views)")
            }
            Divider()
            Text("Recommended")
                .frame(alignment: .bottomTrailing)
                .font(.title.bold())
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(video.recommended) { r in
                        NavigationLink {
                            VideoView(video: r)
                        } label: {
                            VStack {
                                AImageView(url_string: r.t_medium, overlay_string: "", width: 250, height: 180, max_width: nil, max_height: nil)
                                Text(r.title)
                                HStack {
                                    Text(r.autor).font(.caption)
                                    Divider().frame(height: 10)
                                    Text(r.views).font(.caption)
                                    
                                }
                            }
                            .padding(.leading)
                            .frame(width: 250)
                        }
                    }
                }
            }
        }
        .navigationTitle(video.title).scaledToFit()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if video.empty_recommended() {
                inv_api.video_next_data(video: video)
            }
        }
    }
}
