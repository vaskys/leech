//
//  IQuality.swift
//  Leech
//
//  Created by Samo Vaský on 15/04/2023.
//

import Foundation

enum Quality: String, Codable {
    case end = "end"
    case high = "high"
    case maxres = "maxres"
    case maxresdefault = "maxresdefault"
    case medium = "medium"
    case middle = "middle"
    case qualityDefault = "default"
    case sddefault = "sddefault"
    case start = "start"
}