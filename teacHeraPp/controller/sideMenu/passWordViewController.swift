//
//  passWordViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 06/03/2024.
//

import UIKit

class passWordViewController: UIViewController {
    var iconclick = true
    let imageIcon = UIImageView()
    @IBOutlet weak var CertainPass: UITextField!
    @IBOutlet weak var newPass: UITextField!
    @IBOutlet weak var CurrentPss: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        spaceText(textfield: CertainPass)
        spaceText(textfield: newPass)
        spaceText(textfield: CurrentPss)
        imageIcon.image = UIImage(systemName: "eye")
        let connentView = UIView()
        connentView.addSubview(imageIcon)
        connentView.frame = CGRect(x: 0, y: 0, width: CGFloat(Int(UIImage(systemName: "eye")!.size.width)), height: (UIImage(systemName:  "eye")!.size.height))
        imageIcon.frame = CGRect(x: 10, y: 0, width: CGFloat(Int(UIImage(systemName: "eye")!.size.width)), height: (UIImage(systemName: "eye")!.size.height))
        newPass.leftView = connentView
        newPass.leftViewMode = .always
        let tap = UITapGestureRecognizer(target: self, action: #selector(TappImage))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(tap)
    }
    @objc func TappImage(sender: AnyObject){
        if iconclick{
            newPass.isSecureTextEntry = false
            
            
        }else{
            newPass.isSecureTextEntry = true
            imageIcon.image = UIImage(systemName: "eye.fill")
            let connentView2 = UIView()
            connentView2.addSubview(imageIcon)
            connentView2.frame = CGRect(x: 0, y: 0, width: CGFloat(Int(UIImage(systemName: "eye.fill")!.size.width)), height: (UIImage(systemName:  "eye.fill")?.size.height)!)
            imageIcon.frame = CGRect(x: 10, y: 0, width: CGFloat(Int(UIImage(systemName: "eye.fill")!.size.width)), height: (UIImage(systemName: "eye.fill")?.size.height)!)
            newPass.leftView = connentView2
            newPass.leftViewMode = .always
            let tap = UITapGestureRecognizer(target: self, action: #selector(TappImage))
            imageIcon.isUserInteractionEnabled = true
            imageIcon.addGestureRecognizer(tap)
        }
        iconclick = !iconclick
    }
    @IBAction func Save(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
extension passWordViewController:UITextFieldDelegate{
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == CurrentPss{
            newPass.becomeFirstResponder()
        }else if textField == newPass{
            CertainPass.becomeFirstResponder()
            
        }else{
            view.endEditing(true)
        }
    }
   
    
    
}
