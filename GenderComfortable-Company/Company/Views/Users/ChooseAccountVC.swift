//
//  ChooseAccountVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 13/08/21.
//

import UIKit

class ChooseAccountVC: UIViewController {

    @IBOutlet weak var tfAccount: TextFieldCustom!
    
    let accountType : [String] = ["Employee","Company"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            let pickerView = UIPickerView()
            pickerView.dataSource = self
            pickerView.delegate = self

        tfAccount.delegate = self
        tfAccount.inputView = pickerView
        
    }
    
    @IBAction func btnStartedAction(_ sender: Any) {
        UtilityManager.shared.entity = tfAccount.text ?? ""
        UtilityManager.shared.push(identifier: "LoginVC", Vw: self, storyBoard: .main)
    }
    
    @IBAction func btnLoginVC(_ sender: Any) {
        UtilityManager.shared.entity = tfAccount.text ?? ""
        UtilityManager.shared.push(identifier: "LoginVC", Vw: self, storyBoard: .main)
    }
    

}

// MARK: - UIPickerViewDelegate

extension ChooseAccountVC: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        tfAccount.text = accountType[0]
    }
    
    
}

// MARK: - UIPickerViewDelegate

extension ChooseAccountVC: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return accountType.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return accountType[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tfAccount.text = accountType[row]
        //pickerView.isHidden = true
    }
}
