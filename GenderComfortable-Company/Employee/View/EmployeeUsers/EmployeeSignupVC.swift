//
//  EmployeeSignupVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class EmployeeSignupVC: UIViewController {
    
    @IBOutlet weak var listTblVw: UITableView!
    var listArray = ["Firstname","Lastname","Email","Password","Training voucher code"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setDelegateDatasource()
    }
    
    @IBAction func btnInsertRowAction(_ sender: Any) {
        listArray.append("Training voucher code")
        listTblVw.beginUpdates()
        listTblVw.insertRows(at: [IndexPath(row: listArray.count-1, section: 0)], with: .automatic)
        listTblVw.endUpdates()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
    @IBAction func btnLoginAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
}

extension EmployeeSignupVC : UITableViewDelegate,UITableViewDataSource{
    
    func setDelegateDatasource(){
        listTblVw.delegate = self
        listTblVw.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "txtCell", for: indexPath) as! SignupTblCell
        
        cell.tfTxt.placeholder = listArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    
}
