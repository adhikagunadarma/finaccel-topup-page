//
//  TopUpViewController.swift
//  finaccel_kredivo_test
//
//  Created by Josephine Fransisca on 21/08/20.
//  Copyright © 2020 Adhika gunadarma. All rights reserved.
//

import UIKit

class TopUpViewController: UIViewController {

    @IBOutlet weak var pulsaBarItem: UITabBarItem!
    @IBOutlet weak var dataPackageBarItem: UITabBarItem!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var mobileNumberLogo: UIImageView!
    @IBOutlet weak var productTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func mobileNumberDidFinish(_ sender: Any) {
    }
    
    func setupView(){
        self.pulsaBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        self.dataPackageBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        navigationController?.navigationBar.barTintColor = UIColor.blue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.tabBar.tintColor = UIColor.orange
        self.tabBar.selectedItem = self.pulsaBarItem
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16)!], for: .selected)
    }

}

extension TopUpViewController : UITabBarDelegate{
 
}
