//
//  PurchaseCourseDetailView.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class PurchaseCourseDetailView: UIView {

    @IBOutlet weak var scrollVw: UIScrollView!
    static var share: PurchaseCourseDetailView? = nil
    static var instance: PurchaseCourseDetailView {
        
        if (share == nil) {
            share = Bundle(for: self).loadNibNamed("PurchaseCourseDetail",
                                                   owner: nil,
                                                   options: nil)?.first as? PurchaseCourseDetailView
        }
        return share!
    }
    
}
