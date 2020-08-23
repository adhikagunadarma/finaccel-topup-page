//
//  MerchantPromoViewController.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit

class MerchantPromoViewController: UIViewController {
    
    
    var merchantPromoViewModel: MerchantPromoViewModel!
    
    @IBOutlet weak var promoBanner: UIImageView!
    @IBOutlet weak var promoTitle: UILabel!
    @IBOutlet weak var promoValidDate: UILabel!
    @IBOutlet weak var promoCode: UITextField!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var promoTNC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.promoTNC.delegate = self
        self.promoTNC.dataSource = self
        
        self.setupView()
        self.setupData()
    }
    
    @IBAction func copyPromoCode(_ sender: Any) {
        UIPasteboard.general.string = self.merchantPromoViewModel.promoPromoCode
    }
    
    func setupView(){
        
        self.promoTNC.separatorStyle = .none
        self.promoTNC.rowHeight = UITableView.automaticDimension;
        self.promoTNC.estimatedRowHeight = 44.0;
    }
    
    func setupData(){
        self.promoBanner.image = UIImage(named :self.merchantPromoViewModel.promoBanner)
        self.promoTitle.text = self.merchantPromoViewModel.promoTitle
        self.promoValidDate.text = self.merchantPromoViewModel.promoValidDate
        self.promoCode.text = self.merchantPromoViewModel.promoPromoCode
    }
    
}

extension MerchantPromoViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.merchantPromoViewModel.numberOfTerms
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromoCell", for: indexPath) as! PromoViewCell
        let term = self.merchantPromoViewModel.promoTnC[indexPath.row]
        cell.promoTerm.text = term
        return cell
    }
    
    
    
}
