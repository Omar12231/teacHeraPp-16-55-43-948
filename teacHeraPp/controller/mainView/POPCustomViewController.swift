//
//  POPCustomViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 01/03/2024.
//

import UIKit

class POPCustomViewController: UIViewController {
    var popp:popup!
    override func viewDidLoad() {
        super.viewDidLoad()
        popp.setupNib(frame: self.view.frame)
        //popp.loginButton.addTarget(self, action: #selector(push3), for: .touchUpInside)

        
    }
   
    


}
