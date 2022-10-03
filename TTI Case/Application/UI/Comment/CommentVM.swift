//
//  CommentVM.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 10/2/22.
//

import Foundation

protocol CommentVMDelegate {
    func updateData()
}

class CommentVM {
    var commentPath: String = ""
    var externalData: Any?
    var data: Array<ListModel>? = []
    var delegate: CommentVMDelegate?
    var dataFetched: Bool = false
}

// MARK: Functions
extension CommentVM {
    func extractPath(){
        if let stringify = externalData as? String {
            self.commentPath = String(stringify.dropLast())
            getComment()
        }
    }
    func getComment(){
        RequestHandler.shared.getRequest(url: "https://www.reddit.com\(commentPath).json", model: Array<ListModel>.self, completion: { [weak self] response in
            guard let self = self else { return }
            self.dataFetched = true
            self.data = response
            self.delegate?.updateData()
        })
    }
}
