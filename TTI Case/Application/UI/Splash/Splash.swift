//
//  Splash.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation
import UIKit

class Splash: UIViewController {
    
    override func viewDidLoad() {
        checkConnection()
    }
    
    
}
// MARK: Functions
extension Splash {
    func checkConnection(){
        DispatchQueue.main.async{
            if NetworkMonitor.shared.isConnected {
                Logger.shared.addLog(message: "Connected to network. App should be start")
            } else {
                Logger.shared.addLog(message: "No Connection. Notify the user.")
            }
        }
    }
}
