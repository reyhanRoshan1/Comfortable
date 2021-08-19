//
//  PurchaseCourseVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class PurchaseCourseVC: UIViewController {

    @IBOutlet weak var purchaseTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setdelegateDatasource()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
}

extension PurchaseCourseVC: UITableViewDelegate,UITableViewDataSource{
    
    func setdelegateDatasource(){
        self.purchaseTblVw.delegate = self
        self.purchaseTblVw.dataSource = self
        
        purchaseTblVw.estimatedRowHeight = 87
        purchaseTblVw.rowHeight = UITableView.automaticDimension
        
        purchaseTblVw.tableFooterView = UIView(frame: .zero)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "purchaseCell", for: indexPath)
            return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        UtilityManager.shared.push(identifier: "PurchaseCourseDetailVC", Vw: self, storyBoard: .account)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
