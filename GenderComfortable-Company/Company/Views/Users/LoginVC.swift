//
//  LoginVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 13/08/21.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var tfPassword: TextFieldCustom!
    @IBOutlet weak var tfUserName: TextFieldCustom!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    @IBAction func btnShowPasswrdAction(_ sender: Any) {
        if tfPassword.isSecureTextEntry{
            tfPassword.isSecureTextEntry = false
        }else{
            tfPassword.isSecureTextEntry = true
        }
    }
    @IBAction func btnForgotAction(_ sender: Any) {
        UtilityManager.shared.push(identifier: "ForgotPasswordVC", Vw: self, storyBoard: .main)
    }
    @IBAction func btnLoginAction(_ sender: Any) {
        if UtilityManager.shared.entity == UtilityManager.Entity.emp.rawValue{
            UtilityManager.shared.push(identifier: "EmployeeHomeVC", Vw: self, storyBoard: .employeeHome)
        }else{
          UtilityManager.shared.push(identifier: "CourseHomeVC", Vw: self, storyBoard: .course)
        }
    }
    
    @IBAction func btnSignUpAction(_ sender: Any) {
        if UtilityManager.shared.entity == UtilityManager.Entity.emp.rawValue{
            UtilityManager.shared.push(identifier: "EmployeeSignupVC", Vw: self, storyBoard: .main)
        }else{
            UtilityManager.shared.push(identifier: "SignUpVC", Vw: self, storyBoard: .main)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
