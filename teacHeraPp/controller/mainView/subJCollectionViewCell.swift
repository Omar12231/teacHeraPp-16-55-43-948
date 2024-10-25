//
//  subJCollectionViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 26/02/2024.
//

import UIKit
@IBDesignable
class subJCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var back: UIImageView!
    @IBOutlet weak var Statg: UILabel!
    @IBOutlet weak var nameSub: UILabel!
    @IBOutlet weak var subimg: UIImageView!
    func dateSet( name: String, photo: UIImage,state: String,photo2: UIImage){
        Statg.text = state
        nameSub.text = name
        subimg.image = photo
        back.image = photo2
    }
  
}
