//
//  JSONDecoder-Remote.swift
//  FriendFace
//
//  Created by Neil Hiddink on 1/27/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, fromURL url: String, completion: @escaping(T) -> Void) {
//        guard let url = URL(string: url) else {
//            fatalError("Invalid URL passed to the JSON decoder.")
//        }
        
//        DispatchQueue.global().async {
//            do {
//                let data = try Data(contentsOf: url
//                decoder.dateDecodingStrategy = .iso8601
//                
//                let downloadedData = try decoder.decode(type, from: data)
//                
//                DispatchQueue.main.async {
//                    completion(downloadedData)
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
    }
}
