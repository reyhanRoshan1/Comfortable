//
//  CourseDetailView.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 14/08/21.
//

import UIKit

class CourseDetailView: UIView {

    static var share: CourseDetailView? = nil
    static var instance: CourseDetailView {
        
        if (share == nil) {
            share = Bundle(for: self).loadNibNamed("CourseDetail",
                                                   owner: nil,
                                                   options: nil)?.first as? CourseDetailView
        }
        return share!
    }
    
    func show() {
        
            let window = UIApplication.shared.keyWindow
            self.frame = (window?.frame)!
            window?.addSubview(self)
        
    }

    

}
