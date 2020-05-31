//
//  PhotoTableCellModel.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 29.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

class PhotoTableCellModel {
    
    var countVideos: String {
        
        return String(photoSet.count_videos)  + " Videos"
    }
    
    var titleContent: String {
        return photoSet.title._content
    }
    
    var countPhoto: String {
        return String(photoSet.count_photos) + " Photos"
    }
    
    var countViews: String {
        return (photoSet.count_views ?? "0") + " Views"
    }
    
    var url: String {
        let urlString = "https://farm"
        let farm = String(photoSet.farm)
        let server = photoSet.server
        let primary = photoSet.primary
        let secret = photoSet.secret
        let url = urlString.appending(farm + ".").appending("staticflickr.com/").appending(server + "/").appending(primary + "_").appending(secret + "_m.jpg")
        return url
    }
    
    var userId: String {
        return photoSet.owner
    }
    
    var albumId: String {
        return photoSet.id
    }
    
    private var photoSet: PhotoSet
    
    init(photoSet: PhotoSet) {
        self.photoSet = photoSet
    }
}
