//
//  HomeTabCell.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 10/1/22.
//

import Foundation
import UIKit
class HomeTabCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    func configure(labelString: String) {
        self.label.text = labelString
    }
}
