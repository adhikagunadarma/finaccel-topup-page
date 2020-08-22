//
//  ProductViewModel.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation
class ProductViewModel {
    
    private var product : Product
    
    init(product : Product) {
        self.product = product
    }
    
    var productRaw : Product{
        return product
    }
    
    var productName : String {
        return product.name
    }
    
    var productImage : String {
        return product.logoOperator
    }
    
    var productPrice : Int {
        return product.price
    }
    
    var productValue : Int {
        return product.value
    }
    
    var formattedPrice : String {
        return ExtraUtils.currencyConverter(self.productPrice)
    }
    
    var formattedValue : String {
        return ExtraUtils.currencyConverter(self.productValue)
    }
    
    
}
