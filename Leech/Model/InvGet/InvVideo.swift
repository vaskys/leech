// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let iVideo = try? JSONDecoder().decode(IVideo.self, from: jsonData)

import Foundation

// MARK: - IVideo
struct IVideo: Codable {
    let type, title, videoId: String
    let videoThumbnails: [Thumbnail]
    let published: Int
    let publishedText: String
    let viewCount, likeCount: Int
    let author, authorId: String
    let authorUrl: String
    let authorThumbnails: [Thumbnail]?
    let lengthSeconds: Int
    let recommendedVideos: [RecommendedVideo]

    enum CodingKeys: String, CodingKey {
        case type, title
        case videoId
        case videoThumbnails
        case published, publishedText, viewCount, likeCount
        case author
        case authorId
        case authorUrl
        case authorThumbnails
        case lengthSeconds
        case recommendedVideos
    }
}

// MARK: - RecommendedVideo
struct RecommendedVideo: Codable {
    let videoId, title: String
    let videoThumbnails: [Thumbnail]
    let author, authorUrl, authorId: String
    let lengthSeconds: Int
    let viewCountText: String
    let viewCount: Int

    enum CodingKeys: String, CodingKey {
        case videoId
        case title, videoThumbnails, author
        case authorUrl
        case authorId
        case lengthSeconds, viewCountText, viewCount
    }
}



