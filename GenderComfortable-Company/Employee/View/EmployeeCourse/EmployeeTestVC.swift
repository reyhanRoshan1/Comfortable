//
//  EmployeeTestVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 15/08/21.
//

import UIKit

class EmployeeTestVC: UIViewController {

    @IBOutlet weak var lblQuest: UILabel!
    @IBOutlet weak var lblTotalQuest: UILabel!
    @IBOutlet weak var optionTblVw: UITableView!
    
    let selectedQuest = ["Option 1","Option 2","Option 3","Option 4"]
    
    var previousIndex : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setdelegateDatasource()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
    @IBAction func btnSubmitAction(_ sender: Any) {
        UtilityManager.shared.push(identifier: "EmployeeTestResultVC", Vw: self, storyBoard: .employeeCourse)
    }
    
}

extension EmployeeTestVC: UITableViewDelegate,UITableViewDataSource{
    
    func setdelegateDatasource(){
        self.optionTblVw.delegate = self
        self.optionTblVw.dataSource = self
        
        optionTblVw.estimatedRowHeight = 87
        optionTblVw.rowHeight = UITableView.automaticDimension
        
        optionTblVw.tableFooterView = UIView(frame: .zero)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedQuest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! EmpTestTblCell
        
        if previousIndex != indexPath.row{
            cell.vwOptionBg.borderColor = UIColor(rgb: 0xF58415)
            cell.imgSelected.image = UIImage(named: "unTest")
        }
        if previousIndex == indexPath.row{
            cell.vwOptionBg.borderColor = UIColor(rgb: 0x6A359F)
            cell.imgSelected.image = UIImage(named: "selectedTest")
        }
        
        cell.lblOption.text = selectedQuest[indexPath.row]
        
            return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        previousIndex = indexPath.row
        optionTblVw.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
}
