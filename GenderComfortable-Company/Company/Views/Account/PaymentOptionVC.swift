//
//  PaymentOptionVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class PaymentOptionVC: UIViewController {

    @IBOutlet weak var paymentTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setdelegateDatasource()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    @IBAction func btnAddAction(_ sender: Any) {
    }
    
}

extension PaymentOptionVC: UITableViewDelegate,UITableViewDataSource{
    
    func setdelegateDatasource(){
        self.paymentTblVw.delegate = self
        self.paymentTblVw.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell", for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondaryCell", for: indexPath)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 150
        }else{
            return 180
        }
    }
    
}
