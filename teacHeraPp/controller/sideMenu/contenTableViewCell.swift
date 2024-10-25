//
//  contenTableViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 06/03/2024.
//

import UIKit

class contenTableViewCell: UITableViewCell {

    @IBOutlet weak var vieew: UIView!
    @IBOutlet weak var dateSend: UILabel!
    @IBOutlet weak var conIMG: UIImageView!
    @IBOutlet weak var askSub: UILabel!
    @IBOutlet weak var contenlabl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    func setCon(photo : UIImage ,date: String,con: String,ask: String){
        conIMG.image = photo
        askSub.text = ask
        contenlabl.text = con
        dateSend.text = date
    }
    func bottomLine(frame: CGRect,view:UIView ){
        let bottom = CALayer()
        bottom.frame = frame
        bottom.backgroundColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(bottom)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
