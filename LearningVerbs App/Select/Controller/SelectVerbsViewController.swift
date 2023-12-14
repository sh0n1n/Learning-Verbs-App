//
//  SelectVerbsViewController.swift
//  LearningVerbs App
//
//  Created by Melkor on 12/12/23.
//

import UIKit

final class SelectVerbsViewController: UITableViewController {
    // MARK: - Properties
    private var dataSource = IrregularVerbs()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tertiaryLabel
        tableView.register(SelectVerbTableViewCell.self, forCellReuseIdentifier: "SelectVerbTableViewCell")
        dataSource.configureVerbs()
    }
}

// MARK: - UITableViewDataSource
extension SelectVerbsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.verbs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectVerbTableViewCell", for: indexPath) as? SelectVerbTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: dataSource.verbs[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SelectVerbsViewController {
    
}
