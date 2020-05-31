//
//  PhotoSetPhoto.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 29.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

struct PhotoSetPhoto: Codable {
    let photoset: PhotoSetFromAlbum?
    let stat: String
}

struct PhotoSetFromAlbum: Codable {
    let id: String
    let primary: String?
    let owner: String
    let ownername: String
    let photo:[Photos]?
    let page: Int
    let per_page: Int?
    let perpage: Int?
    let pages: Int
    let title: String
    let total: Int
}

class Photos: Codable {
    let id: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let isprimary: String?
    let ispublic: Int
    let isfriend: Int
    let isfamily: Int
    var photoInfo: PhotoInfo?
    var sizes: [Size]?
    
    var url: String {
        
        if photoInfo?.photo?.media == "video" {
            
            let size = sizes?.first(where: { (size) -> Bool in
                return size.label == "Small 400"
            })
            
            return size?.source ?? ""
        }else {
            let urlString = "https://farm"
            let farm = String(self.farm)
            let server = self.server
            let primary = self.id
            let secret = self.secret
            let url = urlString.appending(farm + ".").appending("staticflickr.com/").appending(server + "/").appending(primary + "_").appending(secret + "_m.jpg")
            return url
        }
        
    }
}
