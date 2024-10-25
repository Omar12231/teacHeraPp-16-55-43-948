//
//  PayCellTableViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 21/02/2024.
//

import UIKit

class PayCellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var numAcc: UILabel!
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var cientName: UILabel!
    @IBOutlet weak var nameBank: UILabel!
    @IBOutlet weak var BankIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }
    func setUpcell(photo: UIImage,name: String,name2: String,namer3: String,name4: String){
        BankIcon.image = photo
        nameBank.text = name
        cientName.text = name2
        num1.text = namer3
        numAcc.text = name4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

