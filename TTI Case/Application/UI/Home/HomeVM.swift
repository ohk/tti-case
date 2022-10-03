//
//  HomeVM.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation
import Alamofire

enum HomeTabEnums: CaseIterable {
    case new
    case hot
    case best
    case top
    case rising
    
    var tabName : String {
        switch self {
        case .new:
            return "New"
        case .hot:
            return "Hot"
        case .best:
            return "Best"
        case .top:
            return "Top"
        case .rising:
            return "Rising"
        }
    }
    
    var tabPath : String {
        switch self {
        case .new:
            return "new"
        case .hot:
            return "hot"
        case .best:
            return "best"
        case .top:
            return "top"
        case .rising:
            return "rising"
        }
    }
}

protocol HomeVMDelegate {
    func updateData()
}

class HomeVM {
    var tab: HomeTabEnums = .new
    var data: [String: [Children?]] = [:]
    var delegate: HomeVMDelegate?
    
    init() {
        getData()
    }
}

// MARK: Functions
extension HomeVM {
    func selectTab(item: HomeTabEnums) {
        self.tab = item
        let tabPath = self.tab.tabPath
        let count = self.data[tabPath]?.count ?? 0
        if count == 0 {
            getData()
        } else {
            delegate?.updateData()
        }
    
    }
    
    func getData(){
        let tabPath = self.tab.tabPath
        let count = self.data[tabPath]?.count ?? 0
        RequestHandler.shared.getRequest(url: "https://www.reddit.com/r/all/\(self.tab.tabPath).json?limit=35&after=\(count)", model: ListModel.self, completion: { [weak self] response in
            guard let self = self else { return }
            self.data[tabPath] = (self.data[tabPath] ?? []) + (response?.data?.children ?? [])
            self.delegate?.updateData()
        })
    
    }
}
