//
//  NetworkDataFetcher.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 27.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
     let networkService = NetworkService()
     
     func fetchGenericJSONData<T: Decodable>(urlString: String, responseDecoded: @escaping (T?) -> Void){
         networkService.request(urlString: urlString) { (response) in
             
             if let data = response.data {
                let decode = self.decodeJSON(type: T.self, from: data)
                 responseDecoded(decode)
             }else {
                 debugPrint("HTTP Request failed: \(String(describing: response.error))")
                 responseDecoded(nil)
             }
         }
     }
     
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?)-> T? {
         let decoder = JSONDecoder()
         guard let data = from else { return nil}
         do {
             let objects = try decoder.decode(T.self, from: data)
             return objects
         }catch let error as NSError {
            print(error)
             return nil
         }
     }
}
