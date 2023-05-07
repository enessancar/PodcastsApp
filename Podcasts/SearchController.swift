//
//  ViewController.swift
//  Podcasts
//
//  Created by Enes Sancar on 6.05.2023.
//

import UIKit

class SearchController: UITableViewController {
    
    //MARK: - Properties
    var searchResult: [Result] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let centerLabel: UILabel = {
        let label = UILabel()
        label.text = "No results, please enter a search query"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .purple
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setupSearchBar()
    }
}

extension SearchController {
    
    private func style() {
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.identifier)
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(centerLabel)
        
        NSLayoutConstraint.activate([
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 85),
            centerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            centerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

//MARK: - UITableViewDataSource
extension SearchController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        centerLabel.isHidden = searchResult.count != 0
        return searchResult.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else {
            fatalError()
        }
        cell.result = searchResult[indexPath.row]
        return cell
    }
}

//MARK: - UITableViewDelegate
extension  SearchController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: - SearchBarDelegate
extension SearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchService.fetchData(searchText: searchText) { result in
            self.searchResult = result
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchResult = []
    }
}
