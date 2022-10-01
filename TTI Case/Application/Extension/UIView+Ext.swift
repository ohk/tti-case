//
//  UIView+Ext.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 10/1/22.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
