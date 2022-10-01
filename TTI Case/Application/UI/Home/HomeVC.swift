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
    
    @IBOutlet weak var tabsCollectionView: UICollectionView! {
        didSet {
            tabsCollectionView.register(HomeTabCell.nib, forCellWithReuseIdentifier: HomeTabCell.reuseIdentifier)
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            tabsCollectionView.translatesAutoresizingMaskIntoConstraints = false
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            tabsCollectionView.setCollectionViewLayout(layout, animated: true)
        }
    }
    
    override func viewDidLoad() {
        viewModel.delegate = self
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeTabEnums.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tabCell: HomeTabCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTabCell.reuseIdentifier, for: indexPath) as? HomeTabCell else {
            return UICollectionViewCell()
        }
        tabCell.configure(labelString: HomeTabEnums.allCases[indexPath.row].tabName)
        tabCell.contentView.frame = tabCell.bounds;
        tabCell.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return tabCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension HomeVC: HomeVMDelegate {
    func updateData() {
        
    }
}
