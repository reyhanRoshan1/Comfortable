//
//  PurchaseCourseDetailView.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class PurchaseCourseDetailView: UIView,UIScrollViewDelegate {

    @IBOutlet weak var lblUnderCourseStats: UILabel!
    @IBOutlet weak var lblUnderCourseDetail: UILabel!
    @IBOutlet weak var scrollVw: UIScrollView!
    static var share: PurchaseCourseDetailView? = nil
    
     func initialise(){
        self.lblUnderCourseDetail.isHidden = false
        self.lblUnderCourseStats.isHidden = true
    }
    
    static var instance: PurchaseCourseDetailView {
        if (share == nil) {
            share = Bundle(for: self).loadNibNamed("PurchaseCourseDetail",
                                                   owner: nil,
                                                   options: nil)?.first as? PurchaseCourseDetailView
        }
        return share!
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollVw.contentOffset.x)
        print(self.frame.size.width)
        if scrollView.contentOffset.x > 200 && scrollView.contentOffset.x != 0{
          print("hello im greater")
            self.lblUnderCourseDetail.isHidden = true
            self.lblUnderCourseStats.isHidden = false
        }else if scrollView.contentOffset.x == 0{
            self.lblUnderCourseDetail.isHidden = false
            self.lblUnderCourseStats.isHidden = true
            print("i am zero")
        }
    }
    
    
}
