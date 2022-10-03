//
//  RequestHandler.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 10/1/22.
//

import Foundation
import Alamofire

class RequestHandler {
    public static let shared = RequestHandler()
    
    func getRequest<T: Decodable>(url: String, model: T.Type, completion: @escaping (T?) -> ()){
        Logger.shared.addLog(message: "GET REQUEST - URL: \(url)")
        ApplicationLoader.shared.start()
        let request = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
        
        request.responseDecodable(of: model.self) { (response) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                ApplicationLoader.shared.dismiss()
            })
            
            guard let response = response.value else {
                return
            }
            
            completion(response)
        }
    }
}
