//
//  ProductCell.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet private(set) weak var imageViewProduct: UIImageView!
    @IBOutlet private(set) weak var labelTitle: UILabel!
    @IBOutlet private(set) weak var labelPrice: UILabel!
    @IBOutlet private(set) weak var buttonAdd: UIButton!
    
    private var model: ProductItemModel?
    private var dataTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        dataTask?.cancel()
        dataTask = nil
        imageViewProduct.image = nil
    }
    
    func configure(with model: ProductItemModel) {
        self.model = model
        dataTask = imageViewProduct.loadImage(url: model.url)
        dataTask?.resume()
        labelTitle.text = model.title
        labelPrice.text = model.price
    }

    @IBAction private func actionAdd(_ sender: Any) {
        model?.action?()
    }
    
}
