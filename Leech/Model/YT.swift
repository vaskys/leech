// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let kind, etag: String?
    let items: [Item]?
    let nextPageToken: String?
    let pageInfo: PageInfo?
}

// MARK: - Item
struct Item: Codable, Identifiable {
    let kind, etag: String?
    let id: String
    let contentDetails: ContentDetails?
    let statistics: Statistics?
}

// MARK: - ContentDetails
struct ContentDetails: Codable {
    let duration, dimension, definition, caption: String?
    let licensedContent: Bool?
    let contentRating: ContentRating?
    let projection: String?
    let regionRestriction: RegionRestriction?
}

// MARK: - ContentRating
struct ContentRating: Codable {
}

// MARK: - RegionRestriction
struct RegionRestriction: Codable {
    let allowed: [String]?
}



// MARK: - Localized
struct Localized: Codable {
    let title: String?
    let description: String?
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default?
    let maxres: Default?

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault
        case medium, high, standard, maxres
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String?
    let width, height: Int?
}

// MARK: - Statistics
struct Statistics: Codable {
    let viewCount, likeCount, favoriteCount, commentCount: String?
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int?
}

