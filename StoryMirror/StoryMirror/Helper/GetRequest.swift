//
//  GetRequest.swift
//  StoryMirror
//
//  Created by Kamesh on 13/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

class GetRequest: NSObject {
    static func getRequest(getURL: String, completion: @escaping (Any, String) -> ()) {
        print(getURL)
        let url = URL(string: getURL)
        var request = URLRequest(url: url!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        Loader.shared.show()
        let task = session.dataTask(with: request) { (data, response, err) in
            Loader.shared.hide()
            if err != nil {
                completion("nil", err!.localizedDescription)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                    completion(json, "nil")
                } catch let error as NSError {
                    completion("nil", error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}

