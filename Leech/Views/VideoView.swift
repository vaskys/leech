//
//  VideoView.swift
//  Leech
//
//  Created by Samo Vaský on 06/04/2023.
//

import SwiftUI

import WebKit

struct YouTubeView: UIViewRepresentable {
    let id:String
    
    func makeUIView(context: Context) ->  WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.allowsPictureInPictureMediaPlayback = true
        let webView = WKWebView(frame: .zero, configuration: configuration)
           return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://invidious.snopyta.org/embed/\(id)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}



struct VideoView: View {
    var body: some View {
        YouTubeView(id: "xd")
            .frame(width: 300, height: 300)
            .padding()
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
