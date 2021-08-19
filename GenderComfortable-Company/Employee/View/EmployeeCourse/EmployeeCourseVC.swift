//
//  EmployeeCourse.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 15/08/21.
//

import UIKit

class EmployeeCourseVC: UIViewController {

    @IBOutlet weak var lblUnderLess: UILabel!
    @IBOutlet weak var lblUnderMore: UILabel!
    @IBOutlet weak var lessonTblVw: UITableView!
    @IBOutlet weak var tfDesc: UITextView!
    @IBOutlet weak var tfCert: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setdelegateDatasource()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    @IBAction func btnTakeTestAction(_ sender: Any) {
    }
    
}
extension EmployeeCourseVC: UITableViewDelegate,UITableViewDataSource{
    
    func setdelegateDatasource(){
        self.lessonTblVw.delegate = self
        self.lessonTblVw.dataSource = self
        
        lessonTblVw.estimatedRowHeight = 87
        lessonTblVw.rowHeight = UITableView.automaticDimension
        
        lessonTblVw.tableFooterView = UIView(frame: .zero)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lessongCell", for: indexPath)
            return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
