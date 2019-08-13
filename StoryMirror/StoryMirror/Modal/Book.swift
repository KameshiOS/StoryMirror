//
//  Book.swift
//  StoryMirror
//
//  Created by Kamesh on 13/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import Foundation

struct Book {
    var title: String?
    var id: String?
    var genre: [String]?
    var followerCount: Int?
    var likeCount: Int?
    var readTime: Int?
    var viewCount: Int?
    var promoMsg: String?
    
    init(title: String, id: String, genre: [String], followerCount: Int, likeCount: Int, readTime: Int, viewCount: Int, promoMsg: String) {
        self.title = title
        self.id = id
        self.genre = genre
        self.followerCount = followerCount
        self.likeCount = likeCount
        self.readTime = readTime
        self.viewCount = viewCount
        self.promoMsg = promoMsg
    }
}


struct Category {
    var type: String!
    var language: String!
    var books: [Book]!
    
    init(type: String, language: String, books: [Book]) {
        self.type = type
        self.language = language
        self.books = books
    }
}
