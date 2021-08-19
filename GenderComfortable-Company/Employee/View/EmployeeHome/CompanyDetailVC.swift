//
//  CompanyDetailVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 15/08/21.
//

import UIKit

class CompanyDetailVC: UIViewController {

    @IBOutlet weak var companyDetailTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDelegatDatasource()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
}

extension CompanyDetailVC : UITableViewDelegate,UITableViewDataSource{
    
    func setDelegatDatasource()
    {
        companyDetailTblVw.delegate = self
        companyDetailTblVw.dataSource = self
        
        companyDetailTblVw.estimatedRowHeight = 150
        companyDetailTblVw.rowHeight = UITableView.automaticDimension
        
        companyDetailTblVw.estimatedSectionHeaderHeight = 300
        companyDetailTblVw.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyDetailCell", for: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let Vc:CompanyDetailView = CompanyDetailView.instance
       
        return Vc
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 537
    }
    
}


