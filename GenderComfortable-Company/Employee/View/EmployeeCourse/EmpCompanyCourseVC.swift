//
//  EmpCompanyCourseVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 18/08/21.
//

import UIKit

class EmpCompanyCourseVC: UIViewController {

    @IBOutlet weak var CourseTblVw: UITableView!
    @IBOutlet weak var lblBottomCourseDetail: UILabel!
    @IBOutlet weak var lblCourseOffered: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setdelegateDatasource()
        self.lblCourseOffered.isHidden = false
        self.lblBottomCourseDetail.isHidden = true
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x == self.view.frame.size.width{
          print("hello im greater")
            self.lblCourseOffered.isHidden = true
            self.lblBottomCourseDetail.isHidden = false
        }else if scrollView.contentOffset.x == 0{
            self.lblCourseOffered.isHidden = false
            self.lblBottomCourseDetail.isHidden = true
            print("i am zero")
        }
    }
   
    func hideBottomLine(){
        
    }

}

extension EmpCompanyCourseVC: UITableViewDelegate,UITableViewDataSource{
    
    func setdelegateDatasource(){
        self.CourseTblVw.delegate = self
        self.CourseTblVw.dataSource = self
        
        CourseTblVw.estimatedRowHeight = 87
        CourseTblVw.rowHeight = UITableView.automaticDimension
        
        CourseTblVw.tableFooterView = UIView(frame: .zero)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath)
            return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        UtilityManager.shared.push(identifier: "EmployeeCourseVC", Vw: self, storyBoard: .employeeCourse)
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
