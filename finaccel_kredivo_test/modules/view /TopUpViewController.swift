//
//  TopUpViewController.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TopUpViewController: UIViewController {
    
    @IBOutlet weak var pulsaBarItem: UITabBarItem!
    @IBOutlet weak var dataPackageBarItem: UITabBarItem!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var mobileNumberLogo: UIImageView!
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var promoScrollView: UIScrollView!
    
    var topUpViewViewModel: TopUpViewViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topUpViewViewModel = TopUpViewViewModel(query: self.mobileNumberTextField.rx.text.orEmpty.asDriver())
        
        topUpViewViewModel.mobileNumberProducts.drive(onNext: { [unowned self] (_) in
            self.productTableView.reloadData()
            if self.topUpViewViewModel.numberOfProducts == 0 {
                self.productTableView.isHidden = true
            }else{
                self.productTableView.isHidden = false
            }
        }).disposed(by: disposeBag)
        
        topUpViewViewModel.mobileNumberImage.drive(onNext: { [unowned self] (image) in
            if self.topUpViewViewModel.productHasImage {
                self.mobileNumberLogo.image = UIImage(named : image!)
            }else{
                self.mobileNumberLogo.image = nil
            }
            
        }).disposed(by: disposeBag)
        
        self.promoScrollView.delegate = self
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
        
        self.setupView()
        self.setupTimerForPromo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "LoanConfirmationSegueIdentifier"){
            let destVC : LoanConfirmationViewController = segue.destination as! LoanConfirmationViewController
            if let button:UIButton = sender as! UIButton? {
                let selectedRow = button.tag
                let productViewModel = self.topUpViewViewModel.viewModelForProduct(at: selectedRow)
                let mobileNumber = self.mobileNumberTextField.text!
                destVC.loanConfirmationViewViewModel = LoanConfirmationViewViewModel(productViewModel: productViewModel!, mobileNumber: mobileNumber)
            }
        }
        
        if (segue.identifier == "MerchantPromoSegueIdentifier"){
            let destVC : MerchantPromoViewController = segue.destination as! MerchantPromoViewController
            if let button:UIButton = sender as! UIButton? {
                let selectedRow = button.tag
                let promoViewModel = self.topUpViewViewModel.viewModelForPromo(at: selectedRow)
                //                let mobileNumber = self.mobileNumberTextField.text!
                //                destVC.loanConfirmationViewViewModel = LoanConfirmationViewViewModel(productViewModel: productViewModel!, mobileNumber: mobileNumber)
            }
        }
    }
    
    
    func setupView(){
        // setup general ui view
        self.pulsaBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        self.dataPackageBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        self.mobileNumberLogo.layer.cornerRadius = self.mobileNumberLogo.frame.size.width / 2
        self.mobileNumberLogo.clipsToBounds = true
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.tabBar.tintColor = UIColor.orange
        self.tabBar.selectedItem = self.pulsaBarItem
        
        
        //setup tab bar custom style
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16)!], for: .selected)
        
        // setup promo banner
        
        self.promoScrollView.isScrollEnabled = false
        let promoBannerWidth = self.promoScrollView.frame.width * 0.8
        let promoBannerHeight = self.promoScrollView.frame.height
        let promoTotalPadding = CGFloat(20 * 2)
        
        self.promoScrollView.contentSize = CGSize(width:(promoBannerWidth * 3) + (promoTotalPadding * 3) , height:promoBannerHeight)
        
        for i in 0...topUpViewViewModel.numberOfPromos {
            if let viewModel = topUpViewViewModel.viewModelForPromo(at: i){
                let image = UIImage(named: viewModel.promoBanner) as UIImage?
                let button   = UIButton(type: UIButton.ButtonType.custom)
                button.frame = CGRect(x:20.0 + (promoTotalPadding * CGFloat(i)) + (promoBannerWidth * CGFloat(i)), y: 20 ,width:self.promoScrollView.frame.width * 0.8, height:self.promoScrollView.frame.height - promoTotalPadding)
                button.setBackgroundImage(image, for: .normal)
                button.tag = i
                button.addTarget(self, action: #selector(promoButtonPressed), for:.touchUpInside)
                self.promoScrollView.addSubview(button)
            }
        }
        
        //        let imgOne = UIImageView(frame: CGRect(x:20.0 + (promoTotalPadding * 0) + (promoBannerWidth * 0), y: 20 ,width:self.promoScrollView.frame.width * 0.8, height:self.promoScrollView.frame.height - 40))
        //        imgOne.image = UIImage(named: "promo-1")
        //        let imgTwo = UIImageView(frame: CGRect(x:20.0 + (promoTotalPadding * 1) + (promoBannerWidth * 1), y: 20 ,width:self.promoScrollView.frame.width * 0.8, height:self.promoScrollView.frame.height - 40))
        //        imgTwo.image = UIImage(named: "promo-2")
        //        let imgThree = UIImageView(frame: CGRect(x:20.0 + (promoTotalPadding * 2) + (promoBannerWidth * 2), y: 20 ,width:self.promoScrollView.frame.width * 0.8, height:self.promoScrollView.frame.height - 40))
        //        imgThree.image = UIImage(named: "promo-3")
        //
        //        self.promoScrollView.addSubview(imgOne)
        //        self.promoScrollView.addSubview(imgTwo)
        //        self.promoScrollView.addSubview(imgThree)
        
    }
    
    func setupTimerForPromo(){
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextBanner), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextBanner (){
        
        let pageWidth = self.promoScrollView.frame.width * 0.8 + 40
        let maxWidth:CGFloat = (pageWidth * 3)
        let contentOffset:CGFloat = self.promoScrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.promoScrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.promoScrollView.frame.height), animated: true)
    }
    
    @objc func promoButtonPressed (_ sender: UIButton){
        self.performSegue(withIdentifier: "MerchantPromoSegueIdentifier", sender: sender)
    }
    
    @objc func cellButtonPressed(_ sender:UIButton!){
        self.performSegue(withIdentifier: "LoanConfirmationSegueIdentifier", sender: sender)
    }
    
    
}

extension TopUpViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topUpViewViewModel.numberOfProducts
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductViewCell
        
        if let viewModel = topUpViewViewModel.viewModelForProduct(at: indexPath.row){
            cell.configure(viewModel: viewModel)
            cell.priceButton.tag = indexPath.row //or value whatever you want (must be Int)
            cell.priceButton.addTarget(self, action: #selector(cellButtonPressed), for: UIControl.Event.touchUpInside)
        }
        return cell
    }
}

class PromoBanner: UIButton {
    
    var promoViewModel: PromoViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
