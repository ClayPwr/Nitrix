//
//  PhotoInfo.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 30.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {

    let photo: Photo?
    let stat: String
    
}

struct Photo: Codable {
    let id: String
    let secret: String
    let server: String
    let farm: Int
    let dateuploaded: String
    let isfavorite: Int
    let license: String?
    let safety_level: String
    let rotation: Int

    let media: String
}
