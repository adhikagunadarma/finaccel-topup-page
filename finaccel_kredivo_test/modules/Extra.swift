//
//  Extra.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 22/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation

class ExtraUtils {
    
     static func currencyConverter(_ price : Int) -> String{
           let formatter = NumberFormatter()
           formatter.locale = Locale(identifier: "id_ID")
           formatter.numberStyle = .currency
           formatter.maximumFractionDigits = 0
           guard let formattedNumber = formatter.string(from: price as NSNumber) else { return ""}
           return formattedNumber
       }
}
