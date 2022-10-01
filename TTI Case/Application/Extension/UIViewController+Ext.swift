//
//  UIViewController+Ext.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showNativeAlertWith(message: String, buttonTitle: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNativeAlertWith(message: String, action: UIAlertAction){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNativeAlertWith(message: String, positiveAction: UIAlertAction, negativeAction: UIAlertAction){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(negativeAction)
        alert.addAction(positiveAction)
        self.present(alert, animated: true, completion: nil)
    }
}
