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
}

extension UIViewController {
    
    private func pageFinder(vc: PagesEnum) -> UIViewController {
        switch vc {
        case .Home:
            return HomeVC()
        }
    }
    
    func navigateTo(vc: PagesEnum, style: UIModalPresentationStyle? = .overFullScreen) {
        let vc: UIViewController = pageFinder(vc: vc)
        let nav: UINavigationController = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = style ?? .overFullScreen
        self.present(nav,animated: true,completion: nil)
    }
}
