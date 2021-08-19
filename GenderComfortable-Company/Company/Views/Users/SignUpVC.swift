//
//  SignUpVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 13/08/21.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var tfAddress: TextFieldCustom!
    @IBOutlet weak var tfCompanyBio: TextFieldCustom!
    @IBOutlet weak var tfCompanyName: TextFieldCustom!
    @IBOutlet weak var tfPassword: TextFieldCustom!
    @IBOutlet weak var tfEmail: TextFieldCustom!
    @IBOutlet weak var tfUserName: TextFieldCustom!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    @IBAction func btnPasswordShowAction(_ sender: Any) {
        if tfPassword.isSecureTextEntry{
            tfPassword.isSecureTextEntry = false
        }else{
            tfPassword.isSecureTextEntry = true
        }
    }
    @IBAction func btnSignUpAction(_ sender: Any) {
    }
    
    
    @IBAction func btnAlreadyLoginAction(_ sender: Any) {
    }
    
}
