//
//  MenuCollectionViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 01/03/2024.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var NameItem: UILabel!
    @IBOutlet weak var Constant: UIImageView!
    func setUoItems( photo : UIImage , text: String ,const: UIImage){
        NameItem.text = text
        imageItem.image = photo
        Constant.image = const
    }
    
}
