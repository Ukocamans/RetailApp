//
//  ProductListViewController.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import UIKit
import Core

final class ProductListViewController: UIViewController, AlertPresentable {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var viewModel: ProductListViewModelProtocol!
    
    convenience init(viewModel: ProductListViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Ürünler"
        viewModel.loadData()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.register(ProductCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getProducts().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProductCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.getProducts()[indexPath.row])
        return cell
    }
}

extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 182, height: 200)
    }
}

extension ProductListViewController: ProductListViewModelDelegate {
    func handleViewModelOutput(output: ProductListViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? LoadingManager.shared.show() : LoadingManager.shared.dismiss()
        case .finished:
            collectionView.reloadData()
        case .error(let error):
            let action = AlertAction(title: "Tamam", style: .default, isPreffered: true, action: nil)
            show(alert: Alert(title: "Hata", message: error.localizedDescription, actions: [action]), style: .alert)
        case .askNavigationTo(let controller):
            navigationController?.show(controller, sender: nil)
        }
    }
}
