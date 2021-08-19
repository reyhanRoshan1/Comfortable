//
//  AccountVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class AccountVC: UIViewController {
    
    @IBOutlet weak var accountTblVw: UITableView!
    
    //var empAccountArray = ["Edit Profile","Courses","Certifications","Change Password","Terms&conditions","Privacy Policy"]
    
   // var accountArray = ["Edit Profile","Payment Options","Purchased Courses","Change Password","Terms&conditions","Privacy Policy"]
    
    var accountArray : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if UtilityManager.shared.entity == UtilityManager.Entity.emp.rawValue{
            accountArray  = ["Edit Profile","Courses","Certifications","Change Password","Terms&conditions","Privacy Policy"]
        }else{
            accountArray = ["Edit Profile","Payment Options","Purchased Courses","Change Password","Terms&conditions","Privacy Policy"]
        }
        
        
        setdelegateDatasource()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
    @IBAction func btnLogoutAction(_ sender: Any) {
    }
    
    
}

extension AccountVC: UITableViewDelegate,UITableViewDataSource{
    
    func setdelegateDatasource(){
        self.accountTblVw.delegate = self
        self.accountTblVw.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as! AccountTblCell
        
        cell.imgAccount.image = UIImage(named: accountArray[indexPath.row])
        cell.lblAccount.text = accountArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        if accountArray[indexPath.row] == "Edit Profile"{
            if UtilityManager.shared.entity == UtilityManager.Entity.emp.rawValue{
                UtilityManager.shared.push(identifier: "EmployeeEditProfileVC", Vw: self, storyBoard: .account)
            }else{
            UtilityManager.shared.push(identifier: "EditProfileVC", Vw: self, storyBoard: .account)
            }
        }else if accountArray[indexPath.row] == "Payment Options"{
            UtilityManager.shared.push(identifier: "PaymentOptionVC", Vw: self, storyBoard: .account)
            
        }else if accountArray[indexPath.row] == "Purchased Courses"{
            UtilityManager.shared.push(identifier: "PurchaseCourseVC", Vw: self, storyBoard: .account)
            
        }else if accountArray[indexPath.row] == "Change Password"{
            UtilityManager.shared.push(identifier: "ChangePasswordVC", Vw: self, storyBoard: .account)
            
        }else if accountArray[indexPath.row] == "Terms&conditions"{
            
        }else if accountArray[indexPath.row] == "Privacy Policy"{
            
        }else if accountArray[indexPath.row] == "Courses"{
            UtilityManager.shared.push(identifier: "EmpCourseCompanyListingVC", Vw: self, storyBoard: .employeeCourse)
            
        }else if accountArray[indexPath.row] == "Certifications"{
            UtilityManager.shared.push(identifier: "EmployeeCertificatesVC", Vw: self, storyBoard: .employeeCourse)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}
