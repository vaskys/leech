//
//  HomeVM.swift
//  Leech
//
//  Created by Samo Vaský on 09/04/2023.
//

import Foundation
import SwiftUI


@MainActor
final class HomeVM : ObservableObject {
    @Published var videos: [Video] = []
    @Published var loading_data:Bool = false
    
    private let API_KEY: String = "AIzaSyAXQRc8OlWQf_fKuuE4bNpa72XviTNeUUI"
    private let base_url: String = "https://youtube.googleapis.com/youtube/v3/"
    
    
    func get_videos(alert: @escaping (String) -> Void ) {
        let url_string: String = self.base_url + "videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&regionCode=SK&key=" + self.API_KEY
        guard let url = URL(string: url_string) else {
            alert("URL ERROR")
            return
        }
        let url_request = URLRequest(url: url)
        
        let data_task = URLSession.shared.dataTask(with: url_request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                alert("GET ERROR")
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let parsed = try JSONDecoder().decode(Welcome.self, from: data)
                        guard let items = parsed.items else {
                            print("NO ITEMS")
                            alert("NO ITEMS")
                            return
                        }
                        self.videos.removeAll()
                        
                        for item in items {
                            self.videos.append(Video(video_id: item.id, thumbnail: ""))
                        }
                    } catch {
                        print(error.localizedDescription)
                        alert("parse error")
                    }
                }
            }
        }
        data_task.resume()
    }
}
