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
    @Published var videos: [Neviem] = []
    @Published var loading_data:Bool = false
    
    private let API_KEY: String = "AIzaSyAXQRc8OlWQf_fKuuE4bNpa72XviTNeUUI"
    private let base_url: String = "https://youtube.googleapis.com/youtube/v3/"
    private let inv_url: String = "https://invidious.snopyta.org/api/v1/trending?fields=videoId,title,description,viewCount,videoThumbnails,author,authorId,authorThumbnails&pretty=1"
    
    
    func get_videos(alert: @escaping (String) -> Void ) {
        
//        let url_string: String = self.base_url + "videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&regionCode=SK&key=" + self.API_KEY
        let url_string: String = self.inv_url
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
                        let decoded_data = try JSONDecoder().decode([Neviem].self, from: data)
                        self.videos = decoded_data
                        
                    } catch {
                        print(error.localizedDescription)
                        print(error)
                    }
                }
            }
            else {
                print("GET ERROR")
            }
           
        }
        data_task.resume()
    }
}
