//
//  PhotoSize.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 31.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

struct PhotoSize: Codable {
    var sizes: Sizes?
    let stat: String
}

struct Sizes: Codable {
    var size: [Size]?
}

struct Size: Codable {
    let label: String?
    let source: String?
    
    private enum CodingKeys: String, CodingKey {
        case label = "label", source = "source"
    }
    init(label: String? = nil, source: String? = nil) {
        self.label = label
        self.source = source
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(String.self, forKey: .source)
        if let value = try? container.decode(Int.self, forKey: .label) {
            label = String(value)
        } else {
            label = try container.decode(String.self, forKey: .label)
        }
    }
}
