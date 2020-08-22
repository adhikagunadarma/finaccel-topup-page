//
//  ProductViewCell.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit

class ProductViewCell: UITableViewCell {

    @IBOutlet weak var productValue: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
    }
    
    func configure(viewModel : ProductViewModel){
        productValue.text = "\(viewModel.formattedValue)"
        priceButton.setTitle("\(viewModel.formattedPrice)", for: .normal)
    }


  

}
