//
//  NetworkMonitor.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation
import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor : NWPathMonitor
    
    public private(set) var isConnected: Bool = false
    
    private init() {
        monitor = NWPathMonitor()
        
    }
    
    public func startMonitoring(){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Logger.shared.addLog(message: "Network connection status is \(self.isConnected == true ? "connected" : "no connection")")
        }
    }
    
    public func stopMonitoring(){
        monitor.cancel()
    }
}

