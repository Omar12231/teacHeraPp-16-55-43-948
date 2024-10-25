//
//  importsCellCollectionViewCell.swift
//  teacHeraPp
//
//  Created by Macintosh on 06/03/2024.
//

import UIKit

class importsCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Sub: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    func setCell( photo : UIImage , name: String , namMat: String){
        image.image = photo
        Sub.text = namMat
        studentName.text = name
    }
    
}
