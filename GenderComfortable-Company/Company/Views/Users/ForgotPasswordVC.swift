//
//  ForgotPasswordVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 13/08/21.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var tfEmail: TextFieldCustom!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
    @IBAction func btnResetAction(_ sender: Any) {
    }
    
    

}
