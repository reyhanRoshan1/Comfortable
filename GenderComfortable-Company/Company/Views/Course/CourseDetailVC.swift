//
//  CourseDetailVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class CourseDetailVC: UIViewController {

    @IBOutlet weak var courseDetailTblVw: UITableView!
    @IBOutlet weak var vwSeatHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var vwSeat: ViewCustom!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDelegatDatasource()
        self.vwSeatHeightConstraint.constant = 0
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
    @IBAction func btnBuyAction(_ sender: Any) {
        
        
        self.vwSeat.isHidden = false
        self.vwSeatHeightConstraint.constant = 250
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        } completion: { (_) in
        
        }

        
    }
    
    @IBAction func btnContinueAction(_ sender: Any) {
        UtilityManager.shared.push(identifier: "CourseCheckOutVC", Vw: self, storyBoard: .course)
    }
    
}

extension CourseDetailVC : UITableViewDelegate,UITableViewDataSource{
    
    func setDelegatDatasource()
    {
        courseDetailTblVw.delegate = self
        courseDetailTblVw.dataSource = self
        
        courseDetailTblVw.estimatedRowHeight = 100
        courseDetailTblVw.rowHeight = UITableView.automaticDimension
        
        courseDetailTblVw.estimatedSectionHeaderHeight = 100
        courseDetailTblVw.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseDetailCell", for: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let Vc:CourseDetailView = CourseDetailView.instance
        return Vc
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
