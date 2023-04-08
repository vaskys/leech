//
//  VideoView.swift
//  Leech
//
//  Created by Samo Vaský on 06/04/2023.
//

import SwiftUI

import WebKit

struct YouTubeView: UIViewRepresentable {
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://invidious.snopyta.org/embed/i1qdJe9HQS8") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}



struct VideoView: View {
    var body: some View {
        YouTubeView()
                                   .frame(width: 300, height: 300)
                                   .padding()
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
