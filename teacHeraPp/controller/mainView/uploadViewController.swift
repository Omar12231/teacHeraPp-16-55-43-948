//
//  uploadViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 28/02/2024.
//

import UIKit

class uploadViewController: UIViewController {
    var popUp:popup!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   
    @IBAction func back12(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func certaun(_ sender: Any) {
//        self.popUp = popup(frame: self.view.frame, inview: self)
//        popUp.loginButton.setTitle("الرئيسية", for: UIControl.State.normal)
//        popUp.label.text = "تم رفع الملف بنجاح "
//       popUp.loginButton.addTarget(self, action: #selector(push2), for: .touchUpInside)
//        view.addSubview(popUp)
    }
    @objc func push2(){
//        let vc = storyboard?.instantiateViewController(withIdentifier: "homeView") as! HomaViewViewController
//        navigationController?.pushViewController(vc, animated: true)
        printContent("error")
    }
}
