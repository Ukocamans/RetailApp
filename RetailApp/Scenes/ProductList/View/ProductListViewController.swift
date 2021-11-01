//
//  ProductListViewController.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import UIKit

final class ProductListViewController: UIViewController {

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
            print(isLoading)
        case .finished:
            // do something
            collectionView.reloadData()
        case .error(let error):
            dump(error)
        }
    }
}
