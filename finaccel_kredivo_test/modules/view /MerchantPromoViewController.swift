//
//  MerchantPromoViewController.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit

class MerchantPromoViewController: UIViewController {

    @IBOutlet weak var promoBanner: UIImageView!
    @IBOutlet weak var promoTitle: UILabel!
    @IBOutlet weak var promoValidDate: UILabel!
    @IBOutlet weak var promoCode: UITextField!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var promoTNC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func copyPromoCode(_ sender: Any) {
    }
    
}
