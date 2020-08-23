//
//  TopUpViewViewModel.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class TopUpViewViewModel {
    
    private let disposeBag = DisposeBag()
    private let _products = BehaviorRelay<[Product]>(value: [])
    private let _promos = BehaviorRelay<[Promo]>(value: [])
    private let _mobileLogo = BehaviorRelay<String?>(value: nil)
    
    init(query: Driver<String>) {
        self._promos.accept(DataGenerator.getListPromo())
        query
            .throttle(1.0)
            .distinctUntilChanged()
            .drive(onNext: { [weak self] (queryString) in
                if queryString.count >= 4 && (queryString.prefix(2) == "08" || queryString.prefix(3) == "628") {
                    if self?._mobileLogo.value == nil {
                        self?.initializeProductAndImage(Operator(rawValue: String(queryString.prefix(4))) ?? Operator(rawValue: "0")!)
                    }
                }else{
                    self?._mobileLogo.accept(nil)
                    self?._products.accept([])
                }
            }).disposed(by: disposeBag)
    }
    
    var mobileNumberImage: Driver<String?> {
        return _mobileLogo.asDriver()
    }
    
    var mobileNumberProducts : Driver<[Product]>{
        return _products.asDriver()
    }
    
    var productHasImage: Bool {
        return _mobileLogo.value != nil ? true : false
    }
    
    var numberOfProducts: Int {
        return _products.value.count
    }
    
    var promos : Driver<[Promo]>{
        return _promos.asDriver()
    }
    
    var numberOfPromos : Int {
        return _promos.value.count
    }
    
    func viewModelForProduct(at index: Int) -> ProductViewModel? {
        guard index < _products.value.count else {
            return nil
        }
        return ProductViewModel(product: _products.value[index])
    }
    
    func viewModelForPromo(at index: Int) -> PromoViewModel? {
        guard index < _promos.value.count else {
            return nil
        }
        return PromoViewModel(promo : _promos.value[index])
    }

    func initializeProductAndImage(_ prefix : Operator)  {
        let products = DataGenerator.getListProducts(typeOperator: prefix)
        self._products.accept(products)
        self._mobileLogo.accept(products[0].logoOperator)
    }
    
}
