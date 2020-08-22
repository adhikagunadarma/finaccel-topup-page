//
//  TopUpViewViewModel.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation


class LoanConfirmationViewViewModel {
    
    private var kredivoPin : String = ""
    private var adminFee : Int = 0
    private var dueDate : Int = 30
    private let productViewModel : ProductViewModel
    private let mobileNumber : String
    private var orderViewModel : OrderViewModel?
    
    init(productViewModel : ProductViewModel, mobileNumber : String) {
        self.productViewModel = productViewModel
        self.mobileNumber = mobileNumber
    }
    
    var orderMobileNumber : String {
        return mobileNumber
    }
    
    var order : OrderViewModel?{
        return orderViewModel
    }
    
    var pinValidated : Bool {
        return self.kredivoPin != "" ? true : false
    }
    
    var productLogo : String {
        return self.productViewModel.productImage
    }
    
    var productName : String {
        return self.productViewModel.productName
    }
    
    var productPrice : String {
        return ExtraUtils.currencyConverter(self.productViewModel.productPrice)
    }
    
    var productFee : String {
        return ExtraUtils.currencyConverter(self.adminFee)
    }
    
    var productDueDate : String {
        return self.dueDate > 1 ? "Pay in \(self.dueDate) days" : "Pay in \(self.dueDate) day"
    }
    
    var productTotal : String {
        return ExtraUtils.currencyConverter(self.productViewModel.productPrice + self.adminFee)
    }
    
    func setupPin(_ pin : String){
        self.kredivoPin = pin
    }
    
    //asumsi setelah pay, akan tergenerate order scara otomatis
    func generateOrder(){
        let order = Order(id: "KB-8027de03", status: true, product: productViewModel.productRaw, phoneNumber: self.mobileNumber)
        self.orderViewModel = OrderViewModel(order: order)
    }
    
   
    
    
    
    
}
