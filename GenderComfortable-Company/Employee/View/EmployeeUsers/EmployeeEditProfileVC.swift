//
//  EmployeeEditProfileVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 18/08/21.
//

import UIKit

class EmployeeEditProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
   
}
