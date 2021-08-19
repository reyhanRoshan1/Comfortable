//
//  NotificationVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var notificationTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDelegateDatasource()
    }
    

    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
}

extension NotificationVC:UITableViewDelegate,UITableViewDataSource{
    
    func setDelegateDatasource(){
        notificationTblVw.delegate = self
        notificationTblVw.dataSource = self
        
        notificationTblVw.tableFooterView = UIView(frame: .zero)
        
        
        notificationTblVw.estimatedRowHeight = 130
        notificationTblVw.rowHeight = UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
