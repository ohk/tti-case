//
//  NavigationHandler.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation
import UIKit

enum PagesEnum {
    case Home
    case Comment
}

extension UIViewController {
    
    private func pageFinder(vc: PagesEnum, externalData: Any?) -> UIViewController {
        switch vc {
        case .Home:
            return HomeVC()
        case .Comment:
            let vc = CommentVC()
            vc.viewModel.externalData = externalData
            return vc
        }
    }
    
    func navigateTo(vc: PagesEnum, style: UIModalPresentationStyle? = .overFullScreen, externalData: Any? = nil) {
        let vc: UIViewController = pageFinder(vc: vc, externalData: externalData)
        let nav: UINavigationController = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = style ?? .overFullScreen
        self.present(nav,animated: true,completion: nil)
    }
}
