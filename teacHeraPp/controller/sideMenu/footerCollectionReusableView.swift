//
//  footerCollectionReusableView.swift
//  teacHeraPp
//
//  Created by Macintosh on 03/03/2024.
//

import UIKit

class footerCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var view: UIView!
    func bottomLine(frame: CGRect){
        let bottom = CALayer()
        bottom.frame = frame
        bottom.backgroundColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(bottom)
    }
}
