//
//  ChangePasswordVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class ChangePasswordVC: UIViewController {
    @IBOutlet weak var tfReEnterPassword: TextFieldCustom!
    @IBOutlet weak var tfPassword: TextFieldCustom!
    @IBOutlet weak var tfCurrentPassword: TextFieldCustom!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    @IBAction func btnChangeAction(_ sender: Any) {
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
