//
//  HomeRow.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 10/1/22.
//

import Foundation
import UIKit
import SDWebImage

class HomeRow: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subreddit: UILabel!
    @IBOutlet weak var author: UILabel!
    
    func configure(data: ChildrenData?){
        if let imageUrl = data?.thumbnail, imageUrl.contains("redditmedia") {
            self.thumbnail.sd_setImage(with: URL(string: imageUrl))
        } else {
            self.thumbnail.image = UIImage(named: "NoImage")
        }
        
        if let titleData = data?.title {
            self.title.text = titleData
        } else {
            self.title.text = ""
        }
        
        if let subRedditData = data?.subreddit {
            self.subreddit.text = subRedditData
        } else {
            self.subreddit.text = ""
        }
        
        if let authorData = data?.author {
            self.author.text = authorData
        } else {
            self.author.text = ""
        }
    }
}
