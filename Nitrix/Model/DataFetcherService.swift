//
//  DataFetcherService.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 27.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    let albumURL = "https://www.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=ee9ab8c7f09135f849ad5b3626eb6f8d&photoset_id="
    
    let photoSetUrl = "https://www.flickr.com/services/rest/?method=flickr.photosets.getList&api_key=ee9ab8c7f09135f849ad5b3626eb6f8d&user_id=72199305%40N00&per_page=100&format=json&nojsoncallback=1"
    
    
    
    let networkDataFetcher = NetworkDataFetcher()
    
    func fetchAlbum(urlPartUserId: String, urlPartAlbumId: String, completion: @escaping (PhotoSetPhoto?) -> Void) {
        
        let url = albumURL.appending(urlPartAlbumId).appending("&user_id=").appending(urlPartUserId).appending("&format=json&nojsoncallback=1")

        networkDataFetcher.fetchGenericJSONData(urlString: url, responseDecoded: completion)
    }
    
    func fetchPhotoSet(completion: @escaping (PhotoSetList?) -> Void){
        networkDataFetcher.fetchGenericJSONData(urlString: photoSetUrl, responseDecoded: completion)
    }
}
