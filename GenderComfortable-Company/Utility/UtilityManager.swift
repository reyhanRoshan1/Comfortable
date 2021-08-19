//
//  UtilityManager.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 13/08/21.
//

import UIKit

class UtilityManager: NSObject {
    
    public static var shared = UtilityManager()
    
    
    
    private override init() {}
    
    var entity : String {
        get{
            UserDefaults.standard.value(forKey: "entity") as? String ?? ""
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "entity")
        }
    }
    
    enum Entity : String{
        case emp = "Employee"
        case company = "Company"
    }
    

    enum storyBoard : String{
        case main = "Main"
        case course = "Course"
        case account = "Account"
        case employeeHome = "EmployeeHome"
        case employeeCourse = "EmployeeCourse"
    }
    
    func push(identifier:String,Vw:UIViewController,storyBoard:storyBoard){
        let story = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: identifier)
        Vw.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popController(Vw:UIViewController){
        Vw.navigationController?.popViewController(animated: true)
    }
    
}
