//
//  Home.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 9/30/22.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    let viewModel = HomeVM()
    
    override func viewDidLoad() {
        viewModel.delegate = self
    }
}

extension HomeVC: HomeVMDelegate {
    func updateData() {
        
    }
}
