//
//  CartViewController.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CartViewModelProtocol!
    
    convenience init(viewModel: CartViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sepetim"
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UITableViewCell.self)
        tableView.dataSource = self
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension CartViewController: CartViewModelDelegate {

    func handleViewModelOutput(output: CartViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? LoadingManager.shared.show() : LoadingManager.shared.dismiss()
        case .finished:
            // do something
            tableView.reloadData()
        case .error(let error):
            dump(error)
        }
    }
}
