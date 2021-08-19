//
//  EmpCompanyCourseVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 18/08/21.
//

import UIKit

class EmpCompanyCourseVC: UIViewController {

    @IBOutlet weak var CourseTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setdelegateDatasource()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
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
