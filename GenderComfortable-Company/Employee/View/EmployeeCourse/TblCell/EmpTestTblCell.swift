//
//  EmpTestTblCell.swift
//  GenderComfortable-Company
//
//  Created by Surinder kumar on 15/08/21.
//

import UIKit

class EmpTestTblCell: UITableViewCell {

    @IBOutlet weak var vwOptionBg: ViewCustom!
    @IBOutlet weak var imgSelected: UIImageView!
    @IBOutlet weak var lblOption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
