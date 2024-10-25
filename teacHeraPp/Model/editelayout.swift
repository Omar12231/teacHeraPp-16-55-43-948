//
//  editelayout.swift
//  teacHeraPp
//
//  Created by Macintosh on 24/02/2024.
//

import Foundation
import UIKit
@IBDesignable
class custom : UIButton{
  @IBInspectable  var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable  var borderWidth : CGFloat = 0 {
          didSet{
              self.layer.borderWidth = borderWidth
          }
      }
    @IBInspectable  var borderColor: UIColor = UIColor.white {
          didSet{
              self.layer.borderColor = borderColor.cgColor
          }
      }
}
@IBDesignable
class lalbel: UILabel{
    @IBInspectable var cornerradius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerradius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var bordercolor: UIColor = UIColor.white{
        didSet{
            self.layer.borderColor = bordercolor.cgColor
        }
    }
}
@IBDesignable
class view :UIView{
    @IBInspectable var cornerradius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerradius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }

    }
    @IBInspectable var bottomlinne : Bool = true{
        didSet{
            bottomLine(view: self)
        }
    }
    func bottomLine(view: view){
        let bottom = CALayer()
        bottom.frame = CGRect(x:-345, y:110, width: 335, height: 1)
        bottom.backgroundColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(bottom)
    }
}
