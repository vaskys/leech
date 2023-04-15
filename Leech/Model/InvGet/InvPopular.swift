// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let iPopular = try? JSONDecoder().decode(IPopular.self, from: jsonData)

import Foundation

// MARK: - IPopularElement
struct IPopularElement: Codable {
    let type: TypeEnum
    let title, videoId, author, authorId: String
    let authorUrl: String
    let authorVerified: Bool
    let videoThumbnails: [VideoThumbnail]
    let description, descriptionHtml: String
    let viewCount, published: Int
    let publishedText: String
    let lengthSeconds: Int
    let liveNow, premium, isUpcoming: Bool

    enum CodingKeys: String, CodingKey {
        case type, title
        case videoId
        case author
        case authorId
        case authorUrl
        case authorVerified, videoThumbnails, description
        case descriptionHtml
        case viewCount, published, publishedText, lengthSeconds, liveNow, premium, isUpcoming
    }
}

enum TypeEnum: String, Codable {
    case video = "video"
    case profile = "profile"
}

// MARK: - VideoThumbnail
struct VideoThumbnail: Codable {
    let quality: Quality?
    let url: String?
    let width, height: Int?
}



typealias IPopular = [IPopularElement]

