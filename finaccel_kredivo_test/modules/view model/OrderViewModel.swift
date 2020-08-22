//
//  ProductViewModel.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation
class OrderViewModel {
    
    private var order : Order
    
    init(order : Order) {
        self.order = order
    }
    
    var orderRaw : Order {
        return order
    }
    
    var orderID : String {
        return order.id
    }
    
    var orderStatus : Bool {
        return order.status
    }
    
    var orderProduct : Product {
        return order.product
    }
    
    var formattedOrderPrice : String {
        return self.currencyConverter(order.product.price)
    }
    
    var orderPhoneNumber : String {
        return order.phoneNumber
    }
    
    private func currencyConverter(_ price : Int) -> String{
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        guard let formattedNumber = formatter.string(from: price as NSNumber) else { return ""}
        return formattedNumber
    }
}
