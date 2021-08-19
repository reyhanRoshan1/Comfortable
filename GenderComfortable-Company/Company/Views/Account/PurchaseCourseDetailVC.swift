//
//  PurchaseCourseDetailVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class PurchaseCourseDetailVC: UIViewController {

    @IBOutlet weak var purchaseDetailTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDelegatDatasource()
        
       
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
}

extension PurchaseCourseDetailVC : UITableViewDelegate,UITableViewDataSource{
    
    func setDelegatDatasource()
    {
        purchaseDetailTblVw.delegate = self
        purchaseDetailTblVw.dataSource = self
        
        purchaseDetailTblVw.estimatedRowHeight = 100
        purchaseDetailTblVw.rowHeight = UITableView.automaticDimension
        
        purchaseDetailTblVw.estimatedSectionHeaderHeight = 100
        purchaseDetailTblVw.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "purchaseDetailCell", for: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let Vc:PurchaseCourseDetailView = PurchaseCourseDetailView.instance
       
        return Vc
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


