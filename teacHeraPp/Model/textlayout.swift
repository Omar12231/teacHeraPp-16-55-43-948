//
//  textlayout.swift
//  teacHeraPp
//
//  Created by Macintosh on 25/02/2024.
//

import Foundation
import UIKit
@IBDesignable
class TextCustome: UITextField{
    @IBInspectable var cornerradius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerradius
        }
    }
    @IBInspectable var borderwidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderwidth
        }
    }
    @IBInspectable var bordercolor: UIColor = .white{
        didSet{
            self.layer.borderColor = bordercolor.cgColor
        }
    }
}
class segment: UISegmentedControl{
    @IBInspectable var titleColor : UIColor = .clear{
        didSet{
            
        }
    }
}
