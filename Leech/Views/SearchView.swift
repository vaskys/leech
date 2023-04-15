//
//  SearchView.swift
//  Leech
//
//  Created by Samo Vaský on 15/04/2023.
//

import SwiftUI

struct SearchView: View {
    @State var search_string: String = ""
    @EnvironmentObject var inv_api: IApi
    
    var body: some View {
        NavigationStack() {
            HStack {
                TextField("Hladaj", text: $search_string)
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        inv_api.search(name: search_string)
                    }
            }
            .padding()
            Text("Search Results")
                .font(.headline.bold())
            ScrollView(.vertical,showsIndicators: true) {
                VStack(spacing: 0) {
                    ForEach(inv_api.search_videos) { video in
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
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
