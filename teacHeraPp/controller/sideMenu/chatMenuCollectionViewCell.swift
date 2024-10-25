//
//  chatMenuCollectionViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 08/03/2024.
//

import UIKit

class chatMenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    func  setData(photo : UIImage , namePers: String){
        image.image = photo
        name.text = namePers
    }
    
}
