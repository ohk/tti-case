//
//  CommentVC.swift
//  TTI Case
//
//  Created by Ömer Hamid Kamışlı on 10/2/22.
//

import Foundation
import UIKit


class CommentVC: UIViewController {
    let viewModel = CommentVM()
    
    @IBOutlet weak var commentsTableView: UITableView! {
        didSet {
            commentsTableView.register(HomeRow.nib, forCellReuseIdentifier: HomeRow.reuseIdentifier)
            commentsTableView.estimatedRowHeight = 150.0
            commentsTableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    @IBOutlet weak var noCommentLabel: UILabel! {
        didSet {
            noCommentLabel.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        viewModel.delegate = self
        viewModel.extractPath()
        addBackButton()
    }
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.left")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}

// MARK: Delegate Function
extension CommentVC: CommentVMDelegate {
    func updateData() {
        commentsTableView.reloadData()
        if viewModel.dataFetched, viewModel.data?.count ?? 0 >= 1, viewModel.data?[1].data?.children?.count == 0  {
            noCommentLabel.isHidden = false
        }
    }
}

// MARK: Tableview
extension CommentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.data?.count ?? 0 >= 1 {
            return viewModel.data?[1].data?.children?.count ?? 0
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard viewModel.data?.count ?? 0 >= 1, let data = viewModel.data?[1].data?.children?[indexPath.row]?.childrenData  else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeRow.reuseIdentifier) as! HomeRow
        cell.configure(data: data, isComment: true)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
    
}
