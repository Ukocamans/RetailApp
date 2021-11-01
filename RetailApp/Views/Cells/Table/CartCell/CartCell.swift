//
//  CartCell.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonRemove: UIButton!
    
    private var model: CartItemModel?
    private var dataTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        dataTask?.cancel()
        dataTask = nil
    }
    
    func configure(with model: CartItemModel) {
        if model.productModel.url != self.model?.productModel.url {
            imageViewProduct.image = nil
            dataTask = imageViewProduct.loadImage(url: model.productModel.url)
            dataTask?.resume()
        }
        self.model = model
        labelTitle.text = model.productModel.title
        labelPrice.text = model.productModel.price
        labelAmount.text = "\(model.amount)"
    }
    
    @IBAction func minusAction(_ sender: Any) {
        guard let model = model else {
            return
        }
        CartManager.shared.substract(productModel: model.productModel)
    }
    @IBAction func plusAction(_ sender: Any) {
        guard let model = model else {
            return
        }
        CartManager.shared.add(productModel: model.productModel)
    }
    @IBAction func removeAction(_ sender: Any) {
        guard let model = model else {
            return
        }
        CartManager.shared.remove(productModel: model.productModel)
    }
}
