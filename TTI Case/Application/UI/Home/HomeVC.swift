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
    
    @IBOutlet weak var rowsTableView: UITableView! {
        didSet {
            rowsTableView.register(HomeRow.nib, forCellReuseIdentifier: HomeRow.reuseIdentifier)
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
        let tabName = HomeTabEnums.allCases[indexPath.row].tabName
        tabCell.configure(labelString: tabName, isSelected: viewModel.tab.tabName == tabName)
        tabCell.contentView.frame = tabCell.bounds;
        tabCell.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return tabCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectTab(item: HomeTabEnums.allCases[indexPath.row] )
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tabPath = viewModel.tab.tabPath
        return viewModel.data[tabPath]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tabPath = viewModel.tab.tabPath
        guard let data = viewModel.data[tabPath]?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeRow.reuseIdentifier) as! HomeRow
        cell.configure(data: data.childrenData)
        return cell
    }
}

extension HomeVC: HomeVMDelegate {
    func updateData() {
        tabsCollectionView.reloadData()
        rowsTableView.reloadData()
    }
}
