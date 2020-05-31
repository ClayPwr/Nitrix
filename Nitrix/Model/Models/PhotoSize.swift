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
    let label: String
    let source: String
}
