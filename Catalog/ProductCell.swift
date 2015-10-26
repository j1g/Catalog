//
//  ProductCell.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 j1g. All rights reserved.
//

import UIKit

protocol ProductCellDelegate: class {
    func addCart(ProductCode: String)
}

class ProductCell: UITableViewCell {
    
    weak var delegate: ProductCellDelegate!
    var productCode: String!

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func addCart(sender: AnyObject) {
        print("CART")
        delegate.addCart(productCode)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
