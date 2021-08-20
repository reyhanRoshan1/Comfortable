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
    @IBOutlet weak var vwCourseComplteHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var vwCourseComplete: ViewCustom!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setdelegateDatasource()
        self.lblUnderLess.isHidden = false
        self.lblUnderMore.isHidden = true
        vwCourseComplteHeightConstraint.constant = 0
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    @IBAction func btnTakeTestAction(_ sender: Any) {
        vwCourseComplete.isHidden = false
        vwCourseComplteHeightConstraint.constant = 311
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        } completion: { (_) in
            
        }

        
    }
    @IBAction func btnTakeTestEarnPointAction(_ sender: Any) {
        UtilityManager.shared.push(identifier: "EmployeeTestVC", Vw: self, storyBoard: .employeeCourse)
    }
    
    @IBAction func btnBackToHomeAction(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: EmployeeHomeVC.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x == self.view.frame.size.width{
          print("hello im greater")
            self.lblUnderLess.isHidden = true
            self.lblUnderMore.isHidden = false
        }else if scrollView.contentOffset.x == 0{
            self.lblUnderLess.isHidden = false
            self.lblUnderMore.isHidden = true
            print("i am zero")
        }
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
