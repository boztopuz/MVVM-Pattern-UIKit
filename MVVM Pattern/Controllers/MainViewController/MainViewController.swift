//
//  MainViewController.swift
//  MVVM Pattern
//
//  Created by Burak Öztopuz on 1.06.2023.
//

import UIKit

class MainViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var mainTableView: UITableView!
    
    //ViewModel:
    var viewModel: MainViewModal = MainViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
       
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .blue
        setupTableView()
    }
}
