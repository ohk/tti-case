//
//  HomeVM.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation

enum HomeTabEnums {
    case new
    case hot
    case random
    case top
    
    var tabName : String {
        switch self {
        case .new:
            return "New"
        case .hot:
            return "Hot"
        case .random:
            return "Random"
        case .top:
            return "Top"
        }
    }
    
    var tabPath : String {
        switch self {
        case .new:
            return "new"
        case .hot:
            return "hot"
        case .random:
            return "random"
        case .top:
            return "top"
        }
    }
}

protocol HomeVMDelegate {
    func updateData()
}

class HomeVM {
    var tab: HomeTabEnums = .new
    var data: Any? = nil
    var delegate: HomeVMDelegate?
    
    init() {}
}

// MARK: Functions
extension HomeVM {
    
}
