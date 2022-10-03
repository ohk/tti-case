//
//  ApplicationLoader.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 10/1/22.
//

import Foundation
import Lottie
import UIKit

class ApplicationLoader {
    
    public static let shared = ApplicationLoader()

    private var animationView: AnimationView?
    
    private var counter = 0 {
        didSet {
            DispatchQueue.main.async { [weak self] in
                if self?.counter == 0 {
                    self?.hideAnimation()
                }
            }
        }
    }
    /**
    Starts Loading Animation
    */
    func start() {
        if counter == 0 {
            showAnimation()
        }
        self.counter += 1
    }
    
    func showAnimation() {
        DispatchQueue.main.async {
            if let window = UIWindow.key {
                self.animationView = .init(name: "wave-loading")
                self.animationView?.frame = CGRect(x: CGFloat.greatestFiniteMagnitude, y: CGFloat.greatestFiniteMagnitude, width: 300, height: 300)
                self.animationView?.center = window.center
                self.animationView?.loopMode = .loop
                self.animationView?.animationSpeed = 2
                if self.animationView != nil {
                    window.addSubview(self.animationView!)
                }
                self.animationView?.play()
            }
        }
    }
    
    func hideAnimation() {
        DispatchQueue.main.async {
            self.animationView?.stop()
            self.animationView?.removeFromSuperview()
        }
    }
    
    /**
     Cancels Loading Animation.
     */
    func dismiss(){
        if self.counter > 0 {
            self.counter -= 1
        }
    }
}
