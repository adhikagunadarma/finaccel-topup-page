//
//  Data.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 23/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import Foundation


//example only
enum Operator: String {
    case xl = "0878"
    case indosat = "0814"
    case telkomsel = "0811"
    case others = "0"
}

class DataGenerator {
    static func getListProducts(typeOperator : Operator) -> [Product] {
        var products : [Product] = []
        switch (typeOperator){
        case .xl :
            products = [
                Product(name: "Paket Data XL Supreme Type A", value: 25000, price: 25000, logoOperator : "xl-logo"),
                Product(name: "Paket Data XL Supreme Type B", value: 50000, price: 50000, logoOperator : "xl-logo"),
                Product(name: "Paket Data XL Supreme Type C", value: 100000, price: 99000, logoOperator : "xl-logo"),
                Product(name: "Paket Data XL Supreme Type X", value: 150000, price: 145000, logoOperator : "xl-logo"),
                Product(name: "Paket Data XL Supreme Type Z", value: 200000, price: 190000, logoOperator : "xl-logo")
            ]
            break
        case .indosat:
            products = [
                Product(name: "Paket Data Indosat Freedom Type A", value: 25000, price: 25000, logoOperator : "indosat-logo"),
                Product(name: "Paket Data Indosat Freedom Type B", value: 50000, price: 50000, logoOperator : "indosat-logo"),
                Product(name: "Paket Data Indosat Freedom Type C", value: 100000, price: 99000, logoOperator : "indosat-logo"),
                Product(name: "Paket Data Indosat Freedom Type X", value: 150000, price: 145000, logoOperator : "indosat-logo"),
                Product(name: "Paket Data Indosat Freedom Type Z", value: 200000, price: 190000, logoOperator : "indosat-logo")
            ]
            break
        case .telkomsel:
            products = [
                Product(name: "Paket Data Telkomsel X-treme Type A", value: 25000, price: 25000, logoOperator : "telkomsel-logo"),
                Product(name: "Paket Data Telkomsel X-treme Type B", value: 50000, price: 50000, logoOperator : "telkomsel-logo"),
                Product(name: "Paket Data Telkomsel X-treme Type C", value: 100000, price: 99000, logoOperator : "telkomsel-logo"),
                Product(name: "Paket Data Telkomsel X-treme Type X", value: 150000, price: 145000, logoOperator : "telkomsel-logo"),
                Product(name: "Paket Data Telkomsel X-treme Type Z", value: 200000, price: 190000, logoOperator : "telkomsel-logo")
            ]
            break
        case .others:
            products = [
                Product(name: "Paket Data Operator Lain Type A", value: 25000, price: 25000, logoOperator : "others-logo"),
                Product(name: "Paket Data Operator Lain  Type B", value: 50000, price: 50000, logoOperator : "others-logo"),
                Product(name: "Paket Data Operator Lain  Type C", value: 100000, price: 99000, logoOperator : "others-logo"),
                Product(name: "Paket Data Operator Lain  Type X", value: 150000, price: 145000, logoOperator : "others-logo"),
                Product(name: "Paket Data Operator Lain  Type Z", value: 200000, price: 190000, logoOperator : "others-logo")
            ]
            break
        }
        return products
    }
    
    static func getListPromo() -> [Promo] {
        let promos : [Promo] = [
            Promo(imageBanner: "promo-1", title: "Discount 20% at Kedai Hape Original, Mall Kota Kasablabka", validDate: "10-31 Januari 2019", promoCode: "BIRTHDAY9", termsCondition: DataGenerator.getTnC()),
            Promo(imageBanner: "promo-2", title: "Buy 1 Get 1 free Pizza Marzano, Mall Grand Indonesia", validDate: "14-25 Febuari 2030", promoCode: "VALENTINE14", termsCondition: DataGenerator.getTnC()),
            Promo(imageBanner: "promo-3", title: "Discount 50% at Kedai Kopi Kulo, Mall Central Park", validDate: "24-25 December 2192", promoCode: "CHRISTMAS92", termsCondition: DataGenerator.getTnC())]
        return promos
    }
    
    static func getTnC() -> [String] {
        return [
            "Promo berlaku untuk transaksi yang dilakukan di aplikasi terbaru Bukalapak",
            "Gunakan kode promo untuk dapatkan cashback sebesar 3%",
            "Promo hanya berlaku untuk transaksi yang menggunakan metode pengiriman J&T Express dan Ninja Express (REG & FAST)",
            "Setiap pengguna bisa menggunakan promo sebanyak 1 (satu) kali per hari dan maksimal 2 (dua) kali selama periode promo",
            "Promo bisa digunakan untuk belanja prodak kategori apa saja yang ada di Bukalapak, kecuali kategori tiket dan voucer, produk virtual(pulsa, paket data, voucer game, listrik prabayar & pascabayar, tiket event, tiket pesawat, tiket kereta, pembayaran zakat online, pembayaran tagihan listrik, air PDAM, dan BPJS) dan prodak keuangan (BukaEmas dan BukaReksa)"
        ]
    }
    
}



