//
//  NetworkService.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 27.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    func request(urlString: String, completion: @escaping (AFDataResponse<Any>)-> Void) {
        AF.request(urlString)
            .validate(statusCode: 200..<300)
        .responseJSON(completionHandler: completion)
    }
}
