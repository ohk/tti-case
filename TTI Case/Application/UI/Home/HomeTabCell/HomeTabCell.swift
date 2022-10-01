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
    @IBOutlet weak var stackView: UIStackView!
    
    func configure(labelString: String, isSelected: Bool) {
        self.label.text = labelString
        if isSelected {
            stackView.backgroundColor = UIColor(named: "Primary")
        } else {
            stackView.backgroundColor = UIColor(named: "LightPrimary")
        }
    }
}
