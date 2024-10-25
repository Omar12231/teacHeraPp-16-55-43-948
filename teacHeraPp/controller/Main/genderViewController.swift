//
//  genderViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 16/02/2024.
//

import UIKit

class genderViewController: UIViewController {
    var tag = false
    var tage2 = false
    let teacherRadio = UIButton(frame: CGRect(x:5, y: 10, width: 20, height: 20))
    let studentRadio = UIButton(frame: CGRect(x:5, y: 10, width: 20, height: 20))
    @IBOutlet weak var nextBTn: UIButton!
    @IBOutlet weak var studentBTN: UIButton!
    @IBOutlet weak var teacherBTn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        edit(sender: nextBTn)
        teacherRadio.addTarget(self, action: #selector(touch), for: UIControl.Event.touchUpInside)
        teacherRadio.setBackgroundImage(UIImage(named: "radio_btn_empty"), for: UIControl.State.normal)
        teacherBTn.addSubview(teacherRadio)
        studentRadio.addTarget(self, action: #selector(touch1), for: UIControl.Event.touchUpInside)
        studentRadio.setBackgroundImage(UIImage(named: "radio_btn_empty"), for: UIControl.State.normal)
        studentBTN.addSubview(studentRadio)

    
        
    }
    @objc func touch( sender : UIButton){
        if tag == false{
            teacherRadio.setBackgroundImage(UIImage(named: "radio_btn_fill"), for: UIControl.State.normal)
            studentRadio.setBackgroundImage(UIImage(named: "radio_btn_empty"), for: UIControl.State.normal)
            teacherBTn.backgroundColor = .white
            teacherBTn.layer.cornerRadius = 10
            teacherBTn.layer.borderWidth = 1
            teacherBTn.layer.borderColor = CGColor(red: 48/255, green: 68/255, blue: 137/255, alpha: 1)
            studentBTN.backgroundColor = UIColor(cgColor: CGColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1))
            studentBTN.layer.cornerRadius = 10
            studentBTN.layer.borderWidth = 0
            studentBTN.layer.borderColor = .none
            
            tag = true
            tage2 = false
        }
        
    }
    @objc func touch1( sender : UIButton){
            if tage2 == false{
                teacherRadio.setBackgroundImage(UIImage(named: "radio_btn_empty"), for: UIControl.State.normal)
                studentRadio.setBackgroundImage(UIImage(named: "radio_btn_fill"), for: UIControl.State.normal)
                studentBTN.backgroundColor = .white
                studentBTN.layer.cornerRadius = 10
                studentBTN.layer.borderWidth = 1
                studentBTN.layer.borderColor = CGColor(red: 48/255, green: 68/255, blue: 137/255, alpha: 1)
                
                teacherBTn.backgroundColor = UIColor(cgColor: CGColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1))
                teacherBTn.layer.cornerRadius = 10
                teacherBTn.layer.borderWidth = 0
                teacherBTn.layer.borderColor = .none
                tage2 = true
                tag = false
            }
        
        
    }
    

    @IBAction func back6(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func teacher(_ sender: UIButton) {
        touch(sender: sender)
    }

    @IBAction func student(_ sender: UIButton) {
        touch1(sender: sender)
    }
    @IBAction func nextView(_ sender: Any) {
    }
}
