//
//  Splash.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation
import UIKit

class Splash: UIViewController {
    private let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        animateGradient()
        checkConnection()
    }
    
    
}
// MARK: Functions
extension Splash {
    func checkConnection(){
        DispatchQueue.main.async{ [weak self] in
            guard let self = self else { return }
            
            if NetworkMonitor.shared.isConnected {
                Logger.shared.addLog(message: "Connected to network. App should be start")
            } else {
                Logger.shared.addLog(message: "No Connection. Notify the user.")
                self.showNativeAlertWith(message: "No Internet Connection. Connection is necessary. App will close.", action: UIAlertAction(title: "Tamam", style: .destructive, handler: { (action) in
                    exit(-1)
                }))
            }
        }
    }
    
    private func animateGradient() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            // create the gradient layer
            self.gradient.frame = self.view.frame
            self.gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            self.gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            self.gradient.colors = [
                UIColor.white.cgColor,
                UIColor(named: "SoftPrimary")?.cgColor ?? UIColor.white.cgColor,
                UIColor(named: "Primary")?.cgColor ?? UIColor.white.cgColor
            ]
            
            self.gradient.locations =  [1, 0.5, 0, 0.5, 1.5]
            
            let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.colors))
            
            animation.fromValue = [
                UIColor(named: "SoftPrimary")?.cgColor  ?? UIColor.white.cgColor,
                UIColor(named: "SoftPrimary")?.cgColor  ?? UIColor.white.cgColor,
                UIColor(named: "Primary")?.cgColor  ?? UIColor.white.cgColor
            ]
            
            animation.toValue = [
                UIColor(named: "Primary")?.cgColor  ?? UIColor.white.cgColor,
                UIColor(named: "SoftPrimary")?.cgColor ?? UIColor.white.cgColor,
                UIColor(named: "Primary")?.cgColor ?? UIColor.white.cgColor
            ]
            
            animation.duration = 1
            animation.autoreverses = true
            animation.repeatCount = .infinity
            
            self.gradient.add(animation, forKey: nil)
            self.view.layer.insertSublayer(self.gradient, at: 0)
        }
    }
}
