//
//  popup.swift
//  teacHeraPp
//
//  Created by Macintosh on 23/02/2024.
//

import UIKit
@IBDesignable
class popup: UIView {
    var vc : UIViewController!
    var view:UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
     init(frame: CGRect , inview: UIViewController) {
        super.init(frame: frame)
        setupNib(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
         vc = inview
    }
    func setupNib( frame :CGRect){
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
    func loadXib() -> UIView{
        let bundel = Bundle(for: type(of: self))
        let nib = UINib(nibName: "popup", bundle: bundel)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
}

