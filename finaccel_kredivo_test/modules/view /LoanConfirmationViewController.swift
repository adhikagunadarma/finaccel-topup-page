//
//  LoanConfirmationViewController.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit

class LoanConfirmationViewController: UIViewController {
    
    var loanConfirmationViewViewModel: LoanConfirmationViewViewModel!
    
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
        self.setupData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PaymentDetailSegueIdentifier" {
            if let destinationVC = segue.destination as? PaymentDetailsViewController {
                guard let orderViewModel = self.loanConfirmationViewViewModel.order else { return }

                destinationVC.paymentDetailViewViewModel = PaymentDetailViewViewModel(orderViewModel: orderViewModel)
            }
        }
    }
    
    @IBAction func payButtonClicked(_ sender: Any) {
        guard let pin = self.pinTextfield.text else { return }
        self.loanConfirmationViewViewModel.setupPin(pin)
        if (!self.loanConfirmationViewViewModel.pinValidated){
            self.presentAlert("Harap isi pin anda terlebih dahulu")
        }else{
            self.loanConfirmationViewViewModel.generateOrder()
            self.performSegue(withIdentifier: "PaymentDetailSegueIdentifier", sender: sender)
        }
    }
  
    func setupView(){
        self.kredivoPinView.layer.cornerRadius = 10.0
        self.noticeOTPView.layer.cornerRadius = 10.0
        self.paymentDetailView.layer.cornerRadius = 10.0
        self.kredivoPinContentView.roundCorners([.bottomLeft, .bottomRight], radius: 10)
        self.paymentDetailsContentView.roundCorners([.bottomLeft, .bottomRight], radius: 10)
        self.phoneView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.phoneView.layer.shadowRadius = 5.0
        self.mobileNumberLogo.layer.cornerRadius = self.mobileNumberLogo.frame.size.width / 2
        self.mobileNumberLogo.clipsToBounds = true
        self.phoneView.layer.shadowColor = UIColor.black.cgColor
        self.phoneView.layer.shadowOpacity = 0.3
        self.phoneView.layer.shadowOffset = .zero
        self.phoneView.layer.shadowRadius = 5
        
        //setup button inside kredivo on
        self.setupButtonInsidePin()
    }
    
    func setupButtonInsidePin(){
        let systemIcon = self.pinTextfield.isSecureTextEntry ? "eye.slash" : "eye"
        let button = UIButton(type: .custom)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .black)
        let image = UIImage(systemName: systemIcon, withConfiguration: imageConfiguration)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.pinTextfield.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.toggleHidePassword), for: .touchUpInside)
        self.pinTextfield.rightView = button
        self.pinTextfield.rightViewMode = .always
        
    }
    
    func setupData(){
        self.otpNotice.text = "OTP IS not needed for first transaction of the day that is less than Rp. 200.000"
        self.mobileNumberText.text = self.loanConfirmationViewViewModel.orderMobileNumber
        self.mobileNumberLogo.image = UIImage(named:  self.loanConfirmationViewViewModel.productLogo)
        self.productName.text = self.loanConfirmationViewViewModel.productName
        self.productFee.text = self.loanConfirmationViewViewModel.productFee
        self.productPrice.text = self.loanConfirmationViewViewModel.productPrice
        self.productEstimatedName.text = self.loanConfirmationViewViewModel.productDueDate
        self.productTotal.text = self.loanConfirmationViewViewModel.productTotal
    }
    
    @IBAction func toggleHidePassword(_ sender: Any) {
        self.pinTextfield.isSecureTextEntry = !self.pinTextfield.isSecureTextEntry
        self.setupButtonInsidePin()
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
extension UIViewController{
    func presentAlert(_ messageText : String){
           let alert = UIAlertController(title: "Error", message: messageText, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           self.present(alert, animated: true, completion: nil)
       }
}
