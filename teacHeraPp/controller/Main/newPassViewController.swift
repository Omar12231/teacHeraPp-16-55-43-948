//
//  newPassViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 15/02/2024.
//

import UIKit

class newPassViewController: UIViewController,UITextFieldDelegate {
    var iconclick = true
    let imageIcon = UIImageView()
    
//    let imageIcon = UIImageView(frame: CGRect(x: 10, y: 0, width: 19, height: 10))
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var certainPassTxt: UITextField!
    @IBOutlet weak var newPassTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        edit(sender: btnSave)
        certainPassTxt.delegate = self
        newPassTxt.delegate = self
        imageIcon.image = UIImage(named: "drob_down")
        let connentView = UIView()
        connentView.addSubview(imageIcon)
        connentView.frame = CGRect(x: 0, y: 0, width: CGFloat(Int(UIImage(named: "drob_down")!.size.width)), height: (UIImage(named: "drob_down")?.size.height)!)
        imageIcon.frame = CGRect(x: 10, y: 0, width: CGFloat(Int(UIImage(named: "drob_down")!.size.width)), height: (UIImage(named: "drob_down")?.size.height)!)
        newPassTxt.leftView = connentView
        newPassTxt.leftViewMode = .always
        let tap = UITapGestureRecognizer(target: self, action: #selector(TappImage))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(tap)
        

        
        
        
        certainPassTxt.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        certainPassTxt.rightViewMode = .always
        newPassTxt.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        newPassTxt.rightViewMode = .always
      
    
   
    }
    @objc func TappImage(sender: AnyObject){
        if iconclick{
            newPassTxt.isSecureTextEntry = false
            
            
        }else{
            newPassTxt.isSecureTextEntry = true
        }
        iconclick = !iconclick
    }
    
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveChange(_ sender: UIButton) {
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == ""{
            textField.backgroundColor = UIColor(cgColor: CGColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1))
            textField.layer.cornerRadius = 10
            textField.layer.borderColor = .none
            textField.layer.borderWidth = 0
        }else if textField.text != ""{
            textField.backgroundColor = .white
            textField.layer.borderColor = CGColor(red: 48/255, green: 68/255, blue: 137/255, alpha: 1)
           
            textField.layer.masksToBounds = true
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 10
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == ""{
            textField.backgroundColor = UIColor(cgColor: CGColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1))
            textField.layer.cornerRadius = 10
            textField.layer.borderColor = .none
            textField.layer.borderWidth = 0
        }else if textField.text != ""{
            textField.backgroundColor = .white
            textField.layer.borderColor = CGColor(red: 48/255, green: 68/255, blue: 137/255, alpha: 1)
           
            textField.layer.masksToBounds = true
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 10
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == newPassTxt {
        certainPassTxt.becomeFirstResponder()
    }else{
        view.endEditing(true)
    }
        
    }
}



