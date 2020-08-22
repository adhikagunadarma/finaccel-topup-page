//
//  TopUpViewViewModel.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation


class PaymentDetailViewViewModel {
    
    private let adminFee : Int = 0
    private let dueDate : Int = 30
    private let orderViewModel : OrderViewModel
    
    init(orderViewModel : OrderViewModel) {
        self.orderViewModel = orderViewModel
    }
    
    var orderMobileNumber : String {
        return self.orderViewModel.orderPhoneNumber
    }
    
    var orderId : String {
        return self.orderViewModel.orderID
    }
    
    var orderStatus : Bool {
        return self.orderViewModel.orderStatus
    }
    
    var productLogo : String {
        return self.orderViewModel.orderProduct.logoOperator
    }
    
    var productName : String {
        return self.orderViewModel.orderProduct.name
    }
    
    var productPrice : String {
        return self.orderViewModel.formattedOrderPrice
    }
    
    var productFee : String {
        return ExtraUtils.currencyConverter(self.adminFee)
    }
    
    var productDueDate : String {
        return self.dueDate > 1 ? "Pay in \(self.dueDate) days" : "Pay in \(self.dueDate) day"
    }
    
    var productTotal : String {
        return ExtraUtils.currencyConverter(self.orderViewModel.orderProduct.price + self.adminFee)
    }
    
}
