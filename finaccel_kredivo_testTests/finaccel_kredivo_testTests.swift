//
//  finaccel_kredivo_testTests.swift
//  finaccel_kredivo_testTests
//
//  Created by Josephine Fransisca on 23/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import XCTest
@testable import finaccel_kredivo_test

class finaccel_kredivo_testTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductViewModel(){
        let product = Product(name: "Product-1", value: 5000, price: 5000, logoOperator: "no-logo")
        let productViewModel = ProductViewModel(product: product)
        XCTAssertEqual(product.name, productViewModel.productName)
        XCTAssertEqual(product.price, productViewModel.productPrice)
        XCTAssertEqual(product.value, productViewModel.productValue)
        XCTAssertEqual(product.logoOperator, productViewModel.productImage)
        
        XCTAssertEqual(ExtraUtils.currencyConverter(product.price), productViewModel.formattedPrice)
        XCTAssertEqual(ExtraUtils.currencyConverter(product.value), productViewModel.formattedValue)
        
    }
    
    
    
    func testProductXLDataModel(){
        let product = Product(name: "Product-1", value: 5000, price: 5000, logoOperator: "xl-logo")
        let products = DataGenerator.getListProducts(typeOperator: .xl)
        for i in 0..<products.count {
            XCTAssertEqual(products[i].logoOperator, product.logoOperator)
        }
    }
    func testProductTelkomselDataModel(){
        let product = Product(name: "Product-1", value: 5000, price: 5000, logoOperator: "telkomsel-logo")
        let products = DataGenerator.getListProducts(typeOperator: .telkomsel)
        for i in 0..<products.count {
            XCTAssertEqual(products[i].logoOperator, product.logoOperator)
        }
    }
    func testProductIndosatDataModel(){
        let product = Product(name: "Product-1", value: 5000, price: 5000, logoOperator: "indosat-logo")
        let products = DataGenerator.getListProducts(typeOperator: .indosat)
        for i in 0..<products.count {
            XCTAssertEqual(products[i].logoOperator, product.logoOperator)
        }
    }
    func testProductOthersDataModel(){
        let product = Product(name: "Product-1", value: 5000, price: 5000, logoOperator: "others-logo")
        let products = DataGenerator.getListProducts(typeOperator: .others)
        for i in 0..<products.count {
            XCTAssertEqual(products[i].logoOperator, product.logoOperator)
        }
    }
    
    func testPromoViewModel(){
        let promo = Promo(imageBanner: "no-banner", title: "Title promo", validDate: "Tanggal promo", promoCode: "promo code", termsCondition: [])
        let promoViewModel = PromoViewModel(promo: promo)
        XCTAssertEqual(promo.title, promoViewModel.promoTitle)
        XCTAssertEqual(promo.imageBanner, promoViewModel.promoBanner)
        XCTAssertEqual(promo.promoCode, promoViewModel.promoCode)
        XCTAssertEqual(promo.termsCondition, promoViewModel.promoTnC)
        XCTAssertEqual(promo.validDate, promoViewModel.promoValidDate)
    }
    
    func testOrderViewModel(){
        let product = Product(name: "Product - 1", value: 5000, price: 5000, logoOperator: "no-logo")
        let order = Order(id: "ID-01", status: true, product: product, phoneNumber: "089690907891")
        let orderViewModel = OrderViewModel(order: order)
        XCTAssertEqual(orderViewModel.orderID, order.id)
        XCTAssertEqual(orderViewModel.orderPhoneNumber, order.phoneNumber)
        XCTAssertEqual(orderViewModel.formattedOrderPrice, ExtraUtils.currencyConverter(order.product.price))
        XCTAssertEqual(orderViewModel.orderStatus, order.status)
        
    }
    
    func testLoanConfirmationViewModel(){
        let product = Product(name: "Product - 1", value: 5000, price: 5000, logoOperator: "no-logo")
        let productVM = ProductViewModel(product: product)
        let mobileNumber = "089690907891"
        let viewModel = ViewControllerMockViewModel.createLoanConfrimationMockViewModel(productVM: productVM, mobileNumber: mobileNumber)
        
        XCTAssertEqual(viewModel.productFee, ExtraUtils.currencyConverter(0))
        XCTAssertEqual(viewModel.productLogo, productVM.productImage)
        XCTAssertEqual(viewModel.productName, productVM.productName)
        XCTAssertEqual(viewModel.productPrice, ExtraUtils.currencyConverter(productVM.productPrice))
        XCTAssertEqual(viewModel.productTotal, ExtraUtils.currencyConverter(productVM.productPrice + 0))
        XCTAssertEqual(viewModel.productDueDate, "Pay in 30 days")
    }
    
    func testSetupPinLoanConfirmationViewModel(){
        let product = Product(name: "Product - 1", value: 5000, price: 5000, logoOperator: "no-logo")
        let productVM = ProductViewModel(product: product)
        let mobileNumber = "089690907891"
        let viewModel = ViewControllerMockViewModel.createLoanConfrimationMockViewModel(productVM: productVM, mobileNumber: mobileNumber)
        
        viewModel.setupPin("123456")
        
        XCTAssertEqual(viewModel.pinValidated, true)
    }
    
    func testSetupPinEmptyLoanConfirmationViewModel(){
        let product = Product(name: "Product - 1", value: 5000, price: 5000, logoOperator: "no-logo")
        let productVM = ProductViewModel(product: product)
        let mobileNumber = "089690907891"
        let viewModel = ViewControllerMockViewModel.createLoanConfrimationMockViewModel(productVM: productVM, mobileNumber: mobileNumber)
        
        viewModel.setupPin("")
        
        XCTAssertEqual(viewModel.pinValidated, false)
    }
    
    func testGenerateOrderLoanConfirmationViewModel(){
        let product = Product(name: "Product - 1", value: 5000, price: 5000, logoOperator: "no-logo")
        let productVM = ProductViewModel(product: product)
        let mobileNumber = "089690907891"
        let viewModel = ViewControllerMockViewModel.createLoanConfrimationMockViewModel(productVM: productVM, mobileNumber: mobileNumber)
        
        let order = Order(id: "KB-8027de03", status: true, product: productVM.productRaw, phoneNumber: mobileNumber)
        
        XCTAssertNil(viewModel.order)
        
        viewModel.generateOrder()
        
        XCTAssertEqual(viewModel.order!.orderID, order.id)
        XCTAssertEqual(viewModel.order!.orderStatus, order.status)
        XCTAssertEqual(viewModel.order!.orderPhoneNumber, order.phoneNumber)
    }
    
    func testPaymentDetailViewModel(){
        let product = Product(name: "Product - 1", value: 5000, price: 5000, logoOperator: "no-logo")
        let order = Order(id: "KB-8027de03", status: true, product: product, phoneNumber: "089690907891")
        let orderVM = OrderViewModel(order: order)
        let viewModel = ViewControllerMockViewModel.createPaymentDetailMockViewModel(orderVM: orderVM)
        
        XCTAssertEqual(viewModel.productFee, ExtraUtils.currencyConverter(0))
        XCTAssertEqual(viewModel.productLogo, orderVM.orderProduct.logoOperator)
        XCTAssertEqual(viewModel.productName, orderVM.orderProduct.name)
        XCTAssertEqual(viewModel.productPrice, ExtraUtils.currencyConverter(orderVM.orderProduct.price))
        XCTAssertEqual(viewModel.productTotal, ExtraUtils.currencyConverter(orderVM.orderProduct.price + 0))
        XCTAssertEqual(viewModel.productDueDate, "Pay in 30 days")
        
        XCTAssertEqual(viewModel.orderId, orderVM.orderID)
        XCTAssertEqual(viewModel.orderStatus, orderVM.orderStatus)
        XCTAssertEqual(viewModel.orderMobileNumber, orderVM.orderPhoneNumber)
    }
    
    func testMerchantPromoViewModel(){
        let promo = Promo(imageBanner: "no-banner", title: "Title promo", validDate: "Tanggal promo", promoCode: "promo code", termsCondition: [])
        let promoViewModel = PromoViewModel(promo: promo)
        let viewModel = ViewControllerMockViewModel.createMerchantPromoMockViewModel(promoVM: promoViewModel)
        XCTAssertEqual(viewModel.promoTnC, promoViewModel.promoTnC)
        XCTAssertEqual(viewModel.promoTitle, promoViewModel.promoTitle)
        XCTAssertEqual(viewModel.promoBanner, promoViewModel.promoBanner)
        XCTAssertEqual(viewModel.promoPromoCode, promoViewModel.promoCode)
        XCTAssertEqual(viewModel.promoValidDate, promoViewModel.promoValidDate)
        
    }
    
    
}
