// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let popular = try? JSONDecoder().decode(Popular.self, from: jsonData)

import Foundation

// MARK: - Popular
struct Neviem: Identifiable,Codable {
    var id = UUID()
    let title, videoId: String
    let videoThumbnails: [Thumbnail]
    let description: String
    let viewCount: Int
    let author, authorId: String
    let authorThumbnails: [Thumbnail]?

    enum CodingKeys: String, CodingKey {
        case title
        case videoId
        case videoThumbnails, description, viewCount, author
        case authorId
        case authorThumbnails
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let url: String
    let width, height: Int
    let quality: String?
}

