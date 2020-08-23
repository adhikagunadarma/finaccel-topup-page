//
//  TopUpViewViewModel.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation


class MerchantPromoViewModel {
    
    private let promoViewModel : PromoViewModel
    
    init(promoViewModel : PromoViewModel) {
        self.promoViewModel = promoViewModel
    }
    
    var promoBanner : String {
        return self.promoViewModel.promoBanner
    }
    
    var promoTitle : String {
        return self.promoViewModel.promoTitle
    }
    
    var promoValidDate : String {
        return self.promoViewModel.promoValidDate
    }
    
    var promoPromoCode : String {
        return self.promoViewModel.promoCode
    }
    
    var promoTnC : [String] {
        return self.promoViewModel.promoTnC
    }
    
    var numberOfTerms : Int {
        return self.promoViewModel.promoTnC.count
    }
    
    
    
    
    
}
