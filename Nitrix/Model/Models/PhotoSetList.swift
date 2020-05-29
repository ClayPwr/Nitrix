//
//  PhotoSetList.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 28.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

struct PhotoSetList: Codable {
    let photosets: PhotoSets?
    let stat: String
}

struct PhotoSets: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photoset: [PhotoSet]?
}
struct PhotoSet: Codable {
    let id: String
    let owner: String
    let username: String
    let primary: String
    let secret: String
    let server: String
    let farm: Int
    let count_views: String?
    let count_comments: String?
    let count_photos: Int
    let count_videos: Int
    let title: Titles
    let description: Descriptions
    let can_comment: Int
    let date_create: String
    let date_update: String
    let photos: Int
    let videos: Int
    let visibility_can_see_set: Int
    let needs_interstitial: Int
}

struct Titles: Codable {
    let _content: String
}
struct Descriptions: Codable {
    let _content: String?
}

