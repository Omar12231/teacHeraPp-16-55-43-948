//
//  deleteViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 08/03/2024.
//

import UIKit

class deleteViewController: UIViewController {

    @IBOutlet weak var vieew: UIView!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Yes(_ sender: UIButton) {
//        yesBtn.backgroundColor = UIColor(cgColor: CGColor(red: 154/255, green: 188/255, blue: 216/255, alpha: 1))
//        yesBtn.tintColor = .white
//        yesBtn.layer.borderWidth = 0
//        yesBtn.layer.borderColor = .none
//        noBtn.backgroundColor = .white
//        noBtn.layer.borderWidth = 1
//        noBtn.layer.borderColor = UIColor.red.cgColor
//        noBtn.tintColor = .red
   
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc")
        navigationController?.pushViewController( vc2!, animated: true)
        
    }
    
    @IBAction func no(_ sender: UIButton) {
//        noBtn.backgroundColor = UIColor(cgColor: CGColor(red: 154/255, green: 188/255, blue: 216/255, alpha: 1))
//        noBtn.tintColor = .white
//        noBtn.layer.borderWidth = 0
//        noBtn.layer.borderColor = .none
//        yesBtn.backgroundColor = .white
//        yesBtn.layer.borderWidth = 1
//        yesBtn.layer.borderColor = UIColor.red.cgColor
//        yesBtn.tintColor = .red
        let vc  = storyboard?.instantiateViewController(identifier: "sidevc")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

