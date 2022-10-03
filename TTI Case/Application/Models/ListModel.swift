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
    
    enum CodingKeys: String, CodingKey {
        case subreddit = "subreddit"
        case title = "title"
        case thumbnail = "thumbnail"
        case author = "author"
    }
    
    init(subreddit: String?, title: String?, thumbnail: String?, author: String?){
        self.subreddit = subreddit
        self.title = title
        self.thumbnail = thumbnail
        self.author = author
    }
}

