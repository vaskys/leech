// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let iSearch = try? JSONDecoder().decode(ISearch.self, from: jsonData)

import Foundation

// MARK: - ISearchElement
struct ISearchElement: Codable {
    let type: String
    let author, authorId: String
    let description, title, videoId: String
    let videoThumbnails: [Thumbnail]
    let viewCount, published: Int
    let publishedText: String
    let lengthSeconds: Int

    enum CodingKeys: String, CodingKey {
        case type, author
        case authorId
        case description
        case title
        case videoId
        case videoThumbnails, viewCount, published, publishedText, lengthSeconds
        
    }
}



typealias ISearch = [ISearchElement]

