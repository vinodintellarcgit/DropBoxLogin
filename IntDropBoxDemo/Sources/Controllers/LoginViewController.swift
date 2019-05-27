//
//  LoginViewController.swift
//  IntDropBoxDemo
//
//  Created by Vinod Tiwari on 25/05/19.
//  Copyright © 2019 Intellarc. All rights reserved.
//

import UIKit
import SwiftyDropbox

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }

    @IBAction func btnLoginAction (_ sender:UIButton){
        self.myButtonInControllerPressed()
    }
}
extension LoginViewController{
    
    func myButtonInControllerPressed() {
        DropboxClientsManager.authorizeFromController(UIApplication.shared,controller: self, openURL: { (url: URL) -> Void in UIApplication.shared.openURL(url)
        })
    }
}
