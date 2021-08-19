//
//  CourseCheckOutDetailVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class CourseCheckOutDetailVC: UIViewController {

    @IBOutlet weak var checkOutDetailTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setdelegateDatasource()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
    @IBAction func btnCheckOutAction(_ sender: Any) {
        UtilityManager.shared.push(identifier: "CoursePaySucesVC", Vw: self, storyBoard: .course)
    }
    

}

extension CourseCheckOutDetailVC: UITableViewDelegate,UITableViewDataSource{
    
    func setdelegateDatasource(){
        self.checkOutDetailTblVw.delegate = self
        self.checkOutDetailTblVw.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 97
        }else{
            return 360
        }
    }
    
}

