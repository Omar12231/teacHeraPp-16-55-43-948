//
//  alertpopo.swift
//  teacHeraPp
//
//  Created by Macintosh on 22/02/2024.
//

import UIKit
@IBDesignable
class alertpopo: UIView {

   
   
    @IBOutlet weak var conntennt: UIView!
    
    @IBOutlet weak var loginvv: UIButton!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibUPFrame(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }
    func xibUPFrame(frame : CGRect){
        let view = loadXib()
        view.frame = frame
        addSubview(view)
    }
    func loadXib() -> UIView{
        let bundel = Bundle(for: type(of: self))
        let nib = UINib(nibName: "pop", bundle: bundel)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view!
    }
}
