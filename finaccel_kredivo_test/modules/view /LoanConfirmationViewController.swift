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
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func pinFinishedEditing(_ sender: Any) {
    }
    @IBAction func payButtonClicked(_ sender: Any) {
    }
  

}
