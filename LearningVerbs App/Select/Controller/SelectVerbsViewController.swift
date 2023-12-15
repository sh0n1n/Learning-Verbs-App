//
//  SelectVerbsViewController.swift
//  LearningVerbs App
//
//  Created by Melkor on 12/12/23.
//

import UIKit

final class SelectVerbsViewController: UITableViewController {
    // MARK: - Properties
    private var dataSource = IrregularVerbs.shared
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select Verbs".localized
        view.backgroundColor = .systemBackground
        tableView.register(SelectVerbTableViewCell.self, forCellReuseIdentifier: "SelectVerbTableViewCell")
    }
    
    // MARK: - Private Methods
    private func isSelected(verb: Verb) -> Bool {
        dataSource.selectedVerbs.contains(where: { $0.infinitive == verb.infinitive})
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
        
        let verb = dataSource.verbs[indexPath.row]
        cell.configure(with: verb, isSelected: isSelected(verb: verb))
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SelectVerbsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let verb = dataSource.verbs[indexPath.row]
        if isSelected(verb: verb) {
            dataSource.selectedVerbs.removeAll(where:  { $0.infinitive == verb.infinitive})
        } else {
            dataSource.selectedVerbs.append(verb)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
