//
//  PaymentDetailsViewController.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit

class PaymentDetailsViewController: UIViewController {
    
    var paymentDetailViewViewModel: PaymentDetailViewViewModel!

    @IBOutlet weak var mobileNumberLogo: UIImageView!
    @IBOutlet weak var mobileNumberText: UILabel!

    @IBOutlet weak var orderIdText: UILabel!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productFeenName: UILabel!
    @IBOutlet weak var productFee: UILabel!
    @IBOutlet weak var productTotal: UILabel!
 
    @IBOutlet weak var productDueDate: UILabel!
    @IBOutlet weak var orderDetailView: UIView!
    @IBOutlet weak var orderDetailContentView: UIView!
    @IBOutlet weak var paymentDetailContentView: UIView!
    @IBOutlet weak var paymentDetailView: UIView!
    @IBOutlet weak var noticeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupData()
    }
    

    @IBAction func okButtonClicked(_ sender: Any) {
    }
    
    func setupView(){
        self.orderDetailView.layer.cornerRadius = 10.0
        self.orderDetailContentView.roundCorners([.bottomLeft, .bottomRight], radius: 10)
        self.paymentDetailView.layer.cornerRadius = 10.0
        self.paymentDetailContentView.roundCorners([.bottomLeft, .bottomRight], radius: 10)
        self.noticeView.layer.cornerRadius = 10.0
    }
    func setupData(){
        self.mobileNumberText.text = self.paymentDetailViewViewModel.orderMobileNumber
        self.mobileNumberLogo.image = UIImage(named:  self.paymentDetailViewViewModel.productLogo)
        self.productName.text = self.paymentDetailViewViewModel.productName
        self.productFee.text = self.paymentDetailViewViewModel.productFee
        self.productPrice.text = self.paymentDetailViewViewModel.productPrice
        self.productDueDate.text = self.paymentDetailViewViewModel.productDueDate
        self.productTotal.text = self.paymentDetailViewViewModel.productTotal
        self.orderIdText.text = self.paymentDetailViewViewModel.orderId
        self.statusText.text = self.paymentDetailViewViewModel.orderStatus ? "Success" : "Fail"
        self.statusText.textColor = self.paymentDetailViewViewModel.orderStatus ? UIColor.systemGreen : UIColor.systemRed
    }
    
}


