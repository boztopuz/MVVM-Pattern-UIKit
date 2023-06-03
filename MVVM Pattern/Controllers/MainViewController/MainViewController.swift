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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //ViewModel:
    var viewModel: MainViewModal = MainViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData()
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .blue
        setupTableView()
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
}
