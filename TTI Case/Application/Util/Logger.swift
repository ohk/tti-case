//
//  Logger.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation

class Logger {
    static let shared = Logger()
    
    func addLog(message: String, always: Bool? = false) {
        #if DEBUG
        print("TTI: \(message)")
        #else
        if always == false {
            //HANDLE LATER
            print("TTI - UNHANDLED LOG: " + message)
        } else {
            print("TTI: \(message)")
        }
        #endif
    }
}
