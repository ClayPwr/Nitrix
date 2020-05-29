//
//  GalleryList.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 27.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

struct GalleryList: Codable {
    let galleries: Galleries?
    let stat: String
}

struct Galleries: Codable {
    let total: Int
    let per_page: Int
    let user_id: String
    let continuation: String
    let gallery: [Gallery]?
}

struct Gallery: Codable {
    let id: String
    let gallery_id: String
    let url: String
    let owner: String
    let username: String
    let iconserver: String
    let iconfarm: Int
    let primary_photo_id: String
    let date_create: String
    let date_update: String
    let count_photos: Int
    let count_videos: Int
    let count_total: Int
    let count_views: Int
    let count_comments: Int
    let title: Title
    let description: Description
    let sort_group: String?
    let primary_photo_server: String
    let primary_photo_farm: Int
    let primary_photo_secret: String
}

struct Title: Codable {
    let _content: String
}

struct Description: Codable {
    let _content: String
}
