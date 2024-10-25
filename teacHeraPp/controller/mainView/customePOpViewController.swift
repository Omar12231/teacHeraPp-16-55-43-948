//
//  customePOpViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 01/03/2024.
//

import UIKit

class customePOpViewController: UIViewController {

    @IBOutlet weak var POPUO: popup!
    override func viewDidLoad() {
        super.viewDidLoad()
        POPUO.setupNib(frame: self.view.frame)
        POPUO.loginButton.setTitle("الرئيسبة", for: UIControl.State.normal)
        POPUO.label.text = "تم رفع الملفات بنجاح"
        POPUO.loginButton.addTarget(self, action: #selector(push2), for: .touchUpInside)
        view.addSubview(POPUO)
    }
    @objc func push2(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "homeView") as! HomaViewViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
