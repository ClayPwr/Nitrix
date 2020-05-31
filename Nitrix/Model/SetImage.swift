//
//  SetImage.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 29.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation
import UIKit

class SetImage {
    
     func setImage(from: Photos) -> String? {
        let urlString = "https://farm"
        
        var url: String {
            let urlString = "https://farm"
            let farm = String(from.farm)
            let server = from.server
            let primary = from.id
            let secret = from.secret
            let url = urlString.appending(farm + ".").appending("staticflickr.com/").appending(server + "/").appending(primary + "_").appending(secret + "_b.jpg")
            return url
        }
        return url
    }
}
