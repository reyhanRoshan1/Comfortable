//
//  EditProfileVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var txtAddress: UITextView!
    @IBOutlet weak var txtCompanyBio: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        txtCompanyBio.layer.cornerRadius = 6
        txtAddress.layer.cornerRadius = 6
        txtAddress.clipsToBounds = true
        txtCompanyBio.clipsToBounds = true
        
        txtCompanyBio.leftSpace()
        txtAddress.leftSpace()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
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

extension UITextView {
func leftSpace() {
    self.textContainerInset = UIEdgeInsets(top: 2, left: 15, bottom: 2, right: 15)
}
}
