//
//  EmpCourseCompanyListingVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 18/08/21.
//

import UIKit

class EmpCourseCompanyListingVC: UIViewController {

    @IBOutlet weak var courseCompClcVw: UICollectionView!
    @IBOutlet weak var vwAddKeyTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var addKeyTblVw: UITableView!
    @IBOutlet weak var vwLicenseKey: UIView!
    
    var listArray = ["License key"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDeleDatasource()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UtilityManager.shared.popController(Vw: self)
    }
    
    @IBAction func btnAdLicenseKeyAction(_ sender: Any) {
        vwLicenseKey.isHidden = false
    }
    
    @IBAction func btnAddKeyAction(_ sender: Any) {
        listArray.append("License key")
        addKeyTblVw.beginUpdates()
        addKeyTblVw.insertRows(at: [IndexPath(row: listArray.count-1, section: 0)], with: .automatic)
        addKeyTblVw.endUpdates()
        
        UIView.animate(withDuration: 0.5) {
            if self.vwAddKeyTopConstraint.constant > 0{
                self.vwAddKeyTopConstraint.constant -= 72
            }else{
                self.vwAddKeyTopConstraint.constant = 0
            }
            self.view.layoutIfNeeded()
        } completion: { (_) in
            
            
        }
        
    }
    
    @IBAction func btnSubmitLicenseAction(_ sender: Any) {
        vwLicenseKey.isHidden = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x < self.view.frame.size.width{
          print("hello im greater")
        }else{
            print("i am zero")
        }
    }
    
}

extension EmpCourseCompanyListingVC : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func setDeleDatasource(){
        courseCompClcVw.delegate = self
        courseCompClcVw.dataSource = self
        setDelegateDatasource()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "courseCell", for: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        
        UtilityManager.shared.push(identifier: "EmpCompanyCourseVC", Vw: self, storyBoard: .employeeCourse)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (courseCompClcVw.frame.size.width / 1), height: 230)
    }
    
    
}

extension EmpCourseCompanyListingVC : UITableViewDelegate,UITableViewDataSource{
    
    func setDelegateDatasource(){
        addKeyTblVw.delegate = self
        addKeyTblVw.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addLicenseCell", for: indexPath) as! CourseCompanyTblCell
        
        cell.tfLicenseKey.placeholder = listArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    
}
