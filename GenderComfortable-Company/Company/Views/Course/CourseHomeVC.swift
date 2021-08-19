//
//  CourseHomeVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class CourseHomeVC: UIViewController {

    @IBOutlet weak var imgCompany: UIImageView!
    @IBOutlet weak var lblNotification: LabelCustom!
    @IBOutlet weak var lblCoursePurchased: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var courseClcVw: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDeleDatasource()
    }
    
    @IBAction func btnAcountAction(_ sender: Any) {
        UtilityManager.shared.push(identifier: "AccountVC", Vw: self, storyBoard: .account)
    }
    
    @IBAction func btnNotificationAction(_ sender: Any) {
        UtilityManager.shared.push(identifier: "NotificationVC", Vw: self, storyBoard: .course)
    }
    
    @IBAction func btnCartAction(_ sender: Any) {
    }
    
}


extension CourseHomeVC : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func setDeleDatasource(){
        courseClcVw.delegate = self
        courseClcVw.dataSource = self
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
        
        UtilityManager.shared.push(identifier: "CourseDetailVC", Vw: self, storyBoard: .course)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (courseClcVw.frame.size.width / 1), height: 230)
    }
    
    
}
