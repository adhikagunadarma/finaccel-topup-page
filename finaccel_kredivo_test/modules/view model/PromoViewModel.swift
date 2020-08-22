//
//  PromoViewModel.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation

class PromoViewModel {
    
    private var promo : Promo
    
    init(promo : Promo) {
        self.promo = promo
    }
    
    var promoRaw : Promo {
        return promo
    }
    
    var promoTitle : String {
        return promo.title
    }
    
    var promoBanner : String {
        return promo.imageBanner
    }
    
    var promoValidDate : String {
        return promo.validDate
    }
    
    var promoTnC : [String]{
        return promo.termsCondition
    }
    
    var promoCode : String {
        return promo.promoCode
    }
    
}
