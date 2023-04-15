//
//  Video.swift
//  Leech
//
//  Created by Samo Vaský on 12/04/2023.
//

import Foundation

class Video: Identifiable, ObservableObject {
    var id = UUID()
    
    var video_id: String = "xd"
    var title: String = "xd"
    var views = "xd"
    var duration = "xd"
    var t_small = "xd"
    var t_medium = "xd"
    var t_high = "xd"
    var desc = "xd"
    var autor = "xd"
    var auto_id = "xd"
    var likes = 0
    var published = "xd"
    
    
    @Published var recommended: [Video] = []
    
   
    init(data: IPopularElement) {
        if data.type == TypeEnum.video {
            self.video_id = data.videoId
            self.title = data.title
            self.views = data.viewCount.description
            self.desc = data.description
            self.autor = data.author
            self.auto_id = data.authorId
            self.duration = data.lengthSeconds.description
            self.published = data.publishedText.description
            
            for thumb in data.videoThumbnails {
                if thumb.quality == Quality.medium {
                    self.t_medium = thumb.url!
                }
            }
        }
    }
    
    init(data: ISearchElement) {
        if data.type == "video" {
            self.video_id = data.videoId
            self.title = data.title
            self.views = data.viewCount.description
            self.desc = data.description
            self.autor = data.author
            self.auto_id = data.authorId
            self.duration = data.lengthSeconds.description
            self.published = data.publishedText.description
            
            for thumb in data.videoThumbnails {
                if thumb.quality == Quality.medium {
                    self.t_medium = thumb.url!
                }
            }
        }
    }
    
    init(data: RecommendedVideo) {
        self.video_id = data.videoId
        self.title = data.title
        self.views = data.viewCount.description
        self.autor = data.author
        self.auto_id = data.authorId
        self.duration = data.lengthSeconds.description
        
        for thumb in data.videoThumbnails {
            if thumb.quality == Quality.medium {
                self.t_medium = thumb.url!
            }
        }
        
    }
    
    func extra_data(data: IVideo) {
        if data.type == "video" {
            self.likes = data.likeCount
            for r in data.recommendedVideos {
                let r_video = Video(data: r)
                recommended.append(r_video)
            }
        }
    }
   
    
    
    func empty_recommended() -> Bool {
        return recommended.isEmpty
    }
}
