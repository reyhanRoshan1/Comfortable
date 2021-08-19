//
//  CompanyDetailView.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 15/08/21.
//

import UIKit

class CompanyDetailView: UIView {

    static var share: CompanyDetailView? = nil
    static var instance: CompanyDetailView {
        
        if (share == nil) {
            share = Bundle(for: self).loadNibNamed("CompanyDetail",
                                                   owner: nil,
                                                   options: nil)?.first as? CompanyDetailView
        }
        return share!
    }

}
