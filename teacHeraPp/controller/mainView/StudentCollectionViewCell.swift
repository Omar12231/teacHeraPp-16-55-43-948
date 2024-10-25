//
//  StudentCollectionViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 26/02/2024.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var studentimage: UIImageView!
    func dateSet( name1: String, photo1: UIImage,state1: String,photo2: UIImage){
        state.text = state1
        name.text = name1
        photo.image = photo2
        studentimage.image = photo1
    }
}
