//
//  HomeVM.swift
//  Leech
//
//  Created by Samo Vaský on 09/04/2023.
//

import Foundation
import SwiftUI


@MainActor
final class IApi: ObservableObject {
    @Published var videos: [Video] = []
    @Published var search_videos: [Video] = []
    
    @Published var loading_data:Bool = false
    private let base_url: String = "https://youtube.googleapis.com/youtube/v3/"
    
    
    func search(name: String) {
        search_videos.removeAll()
        
        let url_string: String = "https://invidious.snopyta.org/api/v1/search?q=\(name)&type=video&region=SK"
        guard let url = URL(string: url_string) else {
            return
        }
        Task {
            do {
                let (data, response ) = try await URLSession.shared.data(from: url)
                if let status = response as? HTTPURLResponse {
                    if status.statusCode == 200 {
                        print("OK")
                        let decoded_data = try JSONDecoder().decode([ISearchElement].self, from: data)
                        parse_search(search: decoded_data)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    func video_next_data(video: Video) {
        if !video.empty_recommended() { return }
        
        let url_string: String = "https://invidious.snopyta.org/api/v1/videos/\(video.video_id)?region=SK"
        guard let url = URL(string: url_string) else {
            return
        }
        Task {
            do {
                let (data, response ) = try await URLSession.shared.data(from: url)
                if let status = response as? HTTPURLResponse {
                    print(status.statusCode)
                    let decoded_data = try JSONDecoder().decode(IVideo.self, from: data)
                    video.extra_data(data: decoded_data)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func get_trending_videos(alert: @escaping (String) -> Void ) {
        if !videos.isEmpty { return }
        
        let url_string: String = "https://invidious.snopyta.org/api/v1/trending?region=SK"
        guard let url = URL(string: url_string) else {
            return
        }
        Task {
            do {
                let (data, response ) = try await URLSession.shared.data(from: url)
                if let status = response as? HTTPURLResponse {
                    print(status.statusCode)
                    let decoded_data = try JSONDecoder().decode([IPopularElement].self, from: data)
                    parse_trending(trending: decoded_data)
                }
            } catch {
                print(error.localizedDescription)
                alert(error.localizedDescription)
            }
        }
    }
    
    
    private func parse_trending(trending: [IPopularElement]) {
        for item in trending {
            videos.append(Video(data: item))
        }
    }
    
    private func parse_search(search: [ISearchElement]) {
        for item in search {
            search_videos.append(Video(data: item))
        }
    }
}
