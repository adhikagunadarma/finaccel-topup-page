//
//  ViewControllerMockViewModel.swift
//  finaccel_kredivo_testTests
//
//  Created by Josephine Fransisca on 23/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation

@testable import finaccel_kredivo_test
class ViewControllerMockViewModel {
    
    static func createLoanConfrimationMockViewModel(productVM : ProductViewModel, mobileNumber : String) -> LoanConfirmationViewViewModel {
        let lcVM = LoanConfirmationViewViewModel(productViewModel: productVM, mobileNumber: mobileNumber)
        return lcVM
    }
    
    static func createPaymentDetailMockViewModel(orderVM : OrderViewModel) -> PaymentDetailViewViewModel {
        let pdVM = PaymentDetailViewViewModel(orderViewModel: orderVM)
        return pdVM
    }
    
    static func createMerchantPromoMockViewModel(promoVM : PromoViewModel) -> MerchantPromoViewModel {
        let mpVM = MerchantPromoViewModel(promoViewModel: promoVM)
        return mpVM
    }
    
    
    
}
