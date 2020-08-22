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

let productsIndosat = [
    Product(name: "Paket Data Indosat Freedom Type A", value: 25000, price: 25000, logoOperator : "indosat-logo"),
    Product(name: "Paket Data Indosat Freedom Type B", value: 50000, price: 50000, logoOperator : "indosat-logo"),
    Product(name: "Paket Data Indosat Freedom Type C", value: 100000, price: 99000, logoOperator : "indosat-logo"),
    Product(name: "Paket Data Indosat Freedom Type X", value: 150000, price: 145000, logoOperator : "indosat-logo"),
    Product(name: "Paket Data Indosat Freedom Type Z", value: 200000, price: 190000, logoOperator : "indosat-logo")
]
let productsXL = [
    Product(name: "Paket Data XL Supreme Type A", value: 25000, price: 25000, logoOperator : "xl-logo"),
    Product(name: "Paket Data XL Supreme Type B", value: 50000, price: 50000, logoOperator : "xl-logo"),
    Product(name: "Paket Data XL Supreme Type C", value: 100000, price: 99000, logoOperator : "xl-logo"),
    Product(name: "Paket Data XL Supreme Type X", value: 150000, price: 145000, logoOperator : "xl-logo"),
    Product(name: "Paket Data XL Supreme Type Z", value: 200000, price: 190000, logoOperator : "xl-logo")
]
let productsTelkomsel = [
    Product(name: "Paket Data Telkomsel X-treme Type A", value: 25000, price: 25000, logoOperator : "telkomsel-logo"),
    Product(name: "Paket Data Telkomsel X-treme Type B", value: 50000, price: 50000, logoOperator : "telkomsel-logo"),
    Product(name: "Paket Data Telkomsel X-treme Type C", value: 100000, price: 99000, logoOperator : "telkomsel-logo"),
    Product(name: "Paket Data Telkomsel X-treme Type X", value: 150000, price: 145000, logoOperator : "telkomsel-logo"),
    Product(name: "Paket Data Telkomsel X-treme Type Z", value: 200000, price: 190000, logoOperator : "telkomsel-logo")
]
let productsOthers = [
    Product(name: "Paket Data Operator Lain Type A", value: 25000, price: 25000, logoOperator : "others-logo"),
    Product(name: "Paket Data Operator Lain  Type B", value: 50000, price: 50000, logoOperator : "others-logo"),
    Product(name: "Paket Data Operator Lain  Type C", value: 100000, price: 99000, logoOperator : "others-logo"),
    Product(name: "Paket Data Operator Lain  Type X", value: 150000, price: 145000, logoOperator : "others-logo"),
    Product(name: "Paket Data Operator Lain  Type Z", value: 200000, price: 190000, logoOperator : "others-logo")
]

let termsAndCondition = [
    "Promo berlaku untuk transaksi yang dilakukan di aplikasi terbaru Bukalapak",
    "Gunakan kode promo untuk dapatkan cashback sebesar 3%",
    "Promo hanya berlaku untuk transaksi yang menggunakan metode pengiriman J&T Express dan Ninja Express (REG & FAST)",
    "Setiap pengguna bisa menggunakan promo sebanyak 1 (satu) kali per hari dan maksimal 2 (dua) kali selama periode promo",
    "Promo bisa digunakan untuk belanja prodak kategori apa saja yang ada di Bukalapak, kecuali kategori tiket dan voucer, produk virtual(pulsa, paket data, voucer game, listrik prabayar & pascabayar, tiket event, tiket pesawat, tiket kereta, pembayaran zakat online, pembayaran tagihan listrik, air PDAM, dan BPJS) dan prodak keuangan (BukaEmas dan BukaReksa)"
]

let listPromos = [
    Promo(imageBanner: "promo-1", title: "Discount 20% at Kedai Hape Original, Mall Kota Kasablabka", validDate: "10-31 Januari 2019", promoCode: "BIRTHDAY9", termsCondition: termsAndCondition),
    Promo(imageBanner: "promo-2", title: "Buy 1 Get 1 free, Mall Grand Indonesia", validDate: "14-25 Febuari 2030", promoCode: "VALENTINE14", termsCondition: termsAndCondition),
    Promo(imageBanner: "promo-3", title: "Discount 50% at Kedai Kopi Kulo, Mall Central Park", validDate: "24-25 December 2192", promoCode: "CHRISTMAS92", termsCondition: termsAndCondition)
]

//example only
enum Operator: String {
    case xl = "0878"
    case indosat = "0814"
    case telkomsel = "0811"
    case others = "0"
}

class TopUpViewViewModel {
    
    private let disposeBag = DisposeBag()
    private let _products = BehaviorRelay<[Product]>(value: [])
    private let _promos = BehaviorRelay<[Promo]>(value: [])
    private let _mobileLogo = BehaviorRelay<String?>(value: nil)
    
    init(query: Driver<String>) {
        self._promos.accept(listPromos)
        query
            .throttle(1.0)
            .distinctUntilChanged()
            .drive(onNext: { [weak self] (queryString) in
                if queryString.count >= 4 && (queryString.prefix(2) == "08" || queryString.prefix(3) == "628") {
                    if self?._mobileLogo.value == nil {
                        print (queryString.prefix(4))
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
        switch prefix{
        case .xl :
            self._products.accept(productsXL)
            self._mobileLogo.accept(productsXL[0].logoOperator)
        case .indosat:
            self._products.accept(productsIndosat)
            self._mobileLogo.accept(productsIndosat[0].logoOperator)
        case .telkomsel:
            self._products.accept(productsTelkomsel)
            self._mobileLogo.accept(productsTelkomsel[0].logoOperator)
        case .others :
            self._products.accept(productsOthers)
            self._mobileLogo.accept(productsOthers[0].logoOperator)
        }
    }
    
}
