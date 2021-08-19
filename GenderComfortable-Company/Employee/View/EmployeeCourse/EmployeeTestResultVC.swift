//
//  EmployeeTestResultVC.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 15/08/21.
//

import UIKit
import KDCircularProgress

class EmployeeTestResultVC: UIViewController {

    @IBOutlet weak var vwResultProgres: KDCircularProgress!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialiseCircularVw()
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func initialiseCircularVw(){
        vwResultProgres.startAngle = -90
        vwResultProgres.progressThickness = 0.3
        vwResultProgres.trackThickness = 0.3
        vwResultProgres.clockwise = true
        vwResultProgres.gradientRotateSpeed = 1
        vwResultProgres.roundedCorners = true
        vwResultProgres.glowMode = .forward
        vwResultProgres.glowAmount = 0.0
        vwResultProgres.progress = 0.8
        vwResultProgres.trackColor = UIColor(rgb: 0xF6FDDA)
        vwResultProgres.set(colors: UIColor(rgb: 0xF58415))
    }
    
    func setResultProgress(_ value : Double){
        vwResultProgres.progress = value
    }

}
