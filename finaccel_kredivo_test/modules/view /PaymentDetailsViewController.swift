//
//  PaymentDetailsViewController.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit

class PaymentDetailsViewController: UIViewController {

    @IBOutlet weak var mobileNumberLogo: UIImageView!
    @IBOutlet weak var mobileNumberText: UILabel!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var orderIdText: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productFeenName: UILabel!
    @IBOutlet weak var productFee: UILabel!
    @IBOutlet weak var productTotal: UILabel!
    @IBOutlet weak var productEstimatedDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func okButtonClicked(_ sender: Any) {
    }
}
