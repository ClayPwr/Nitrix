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
        guard let urlStr = URL(string: url) else { return nil }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: urlStr) else { return }
            DispatchQueue.main.async {
                
            //return UIImage(data: data)
                
            }
        }
        return url
    }
}
