//
//  IThumbnails.swift
//  Leech
//
//  Created by Samo Vaský on 15/04/2023.
//

import Foundation


struct Thumbnail: Codable {
    let url: String?
    let width, height: Int?
    let quality: Quality?
}
