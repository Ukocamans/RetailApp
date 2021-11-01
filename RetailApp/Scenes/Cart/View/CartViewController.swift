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
        NotificationCenter.default.addObserver(self, selector: #selector(amountChangedNotification(_:)), name: .amountChanged, object: nil)
    }
    
    @objc func amountChangedNotification(_ notification: Notification) {
        tableView.reloadData()
    }
    
    private func configureTableView() {
        tableView.register(CartCell.self)
        tableView.dataSource = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .amountChanged, object: nil)
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: CartManager.shared.cartItems[indexPath.row])
        return cell
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
