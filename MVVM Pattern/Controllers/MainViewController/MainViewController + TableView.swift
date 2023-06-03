//
//  MainViewController + TableView.swift
//  MVVM Pattern
//
//  Created by Burak Öztopuz on 1.06.2023.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
        self.mainTableView.backgroundColor = .red
        self.registerCells()
    }
    
    func registerCells() {
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = self.cellDataSource[indexPath.row].originalTitle
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}
