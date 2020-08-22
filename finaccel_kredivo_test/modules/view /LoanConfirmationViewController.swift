//
//  LoanConfirmationViewController.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit

class LoanConfirmationViewController: UIViewController {
    @IBOutlet weak var mobileNumberLogo: UIImageView!
    @IBOutlet weak var mobileNumberText: UILabel!
    @IBOutlet weak var otpNotice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productFee: UILabel!
    @IBOutlet weak var productTotal: UILabel!
    @IBOutlet weak var productFeeName: UILabel!
    @IBOutlet weak var productEstimatedName: UILabel!
    @IBOutlet weak var pinTextfield: UITextField!
    @IBOutlet weak var kredivoPinView: UIView!
    @IBOutlet weak var kredivoPinContentView: UIView!
    @IBOutlet weak var noticeOTPView: UIView!
    @IBOutlet weak var paymentDetailView: UIView!
    @IBOutlet weak var paymentDetailsContentView: UIView!
    @IBOutlet weak var phoneView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    

    @IBAction func pinFinishedEditing(_ sender: Any) {
    }
    @IBAction func payButtonClicked(_ sender: Any) {
    }
  
    
    func setupView(){
        self.kredivoPinView.layer.cornerRadius = 10.0
        self.noticeOTPView.layer.cornerRadius = 10.0
        self.paymentDetailView.layer.cornerRadius = 10.0
        self.kredivoPinContentView.roundCorners([.bottomLeft, .bottomRight], radius: 10)
        self.paymentDetailsContentView.roundCorners([.bottomLeft, .bottomRight], radius: 10)
        self.phoneView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.phoneView.layer.shadowRadius = 5.0
    }

}

extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
