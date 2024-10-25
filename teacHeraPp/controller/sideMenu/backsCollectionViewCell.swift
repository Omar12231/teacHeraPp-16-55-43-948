//
//  backsCollectionViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 13/03/2024.
//

import UIKit

class backsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var namPackag: UILabel!
    @IBOutlet weak var timePAckage: UILabel!
    func setData( name : String , data: String){
        namPackag.text = name
        timePAckage.text = data
    }
}
