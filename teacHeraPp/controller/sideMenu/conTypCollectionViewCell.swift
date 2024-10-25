//
//  conTypCollectionViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 10/03/2024.
//

import UIKit

class conTypCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var review: UILabel!
    func setData(name1:String , rev: String){
        name.text = name1
        review.text = rev
    }
}
