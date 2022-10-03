//
//  ListModel.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 10/1/22.
//

import Foundation

class ListModel: Decodable {
    var data: Data?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    init(data: Data?){
        self.data = data
    }
}


class Data: Decodable {
    var children: [Children?]?
    
    enum CodingKeys: String, CodingKey {
        case children = "children"
    }
    
    init(children: [Children?]?){
        self.children = children
    }
}

class Children: Decodable {
    var childrenData: ChildrenData?
    
    enum CodingKeys: String, CodingKey {
        case childrenData = "data"
    }
    
    init(childrenData: ChildrenData?){
        self.childrenData = childrenData
    }
}


class ChildrenData: Decodable {
    var subreddit: String?
    var title: String?
    var thumbnail: String?
    var author: String?
    var permalink: String?
    var body: String? // for comment
    
    enum CodingKeys: String, CodingKey {
        case subreddit = "subreddit"
        case title = "title"
        case thumbnail = "thumbnail"
        case author = "author"
        case permalink = "permalink"
        case body = "body"
    }
    
    init(subreddit: String?, title: String?, thumbnail: String?, author: String?, body: String?, permalink: String?){
        self.subreddit = subreddit
        self.title = title
        self.thumbnail = thumbnail
        self.author = author
        self.permalink = permalink
        self.body = body
    }
}

