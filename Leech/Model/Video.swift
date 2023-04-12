//
//  Video.swift
//  Leech
//
//  Created by Samo Vaský on 12/04/2023.
//

import Foundation

struct Video: Identifiable {
    var id = UUID()
    
    let video_id: String
    let thumbnail: String
}
