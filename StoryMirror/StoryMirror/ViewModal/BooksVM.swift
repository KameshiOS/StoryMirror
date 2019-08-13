//
//  BooksVM.swift
//  StoryMirror
//
//  Created by Kamesh on 13/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]
typealias responseCallBack = ((Bool, String?) -> ())


public class BookVM {
    public static let shared = BookVM()
    private init() {}
    
    var books = [Book]()
    func getBooks(type: String, language: String, completion: @escaping responseCallBack) {
        GetRequest.getRequest(getURL: API.books.appending("\(type)/\(language)")) { (response, error) in
            print(response)
            print(error)
            if error == "nil" {
                if let json = response as? JSONDictionary {
                    let data = json["data"] as! JSONDictionary
                    let lists = data["content_list"] as! [JSONDictionary]
                    self.parseBooks(lists: lists)
                    completion(true, "")
                } else {
                    completion(false, "Error Parsing Data")
                }
            } else {
                completion(false, error)
            }
        }
    }
    // MARK: Private Methods
    private func parseBooks(lists: [JSONDictionary]) {
        books.removeAll()
        
        for list in lists {
            let title = list["title"] as! String
            let id = list["_id"] as! String
            let genre = list["genre"] as! [String]
            let followerCount = list["author_followers_count"] as! NSNumber
            let likeCount = list["like_count"] as! NSNumber
            let readTime = list["read_time"] as! NSNumber
            let viewCount = list["view_count"] as! NSNumber
            let promoMsg = list["promo_msg"] as! String
            
            let book = Book(title: title, id: id, genre: genre, followerCount: followerCount.intValue, likeCount: likeCount.intValue, readTime: readTime.intValue, viewCount: viewCount.intValue, promoMsg: promoMsg)
            
            books.append(book)
        }
    }
}
