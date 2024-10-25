//
//  codeViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 14/02/2024.
//

import UIKit

class codeViewController: UIViewController,UITextFieldDelegate {
    var mytimer : Timer!
    var timerleft = 50
    @IBOutlet weak var TimerLbl: UILabel!
    @IBOutlet weak var num4: UITextField!
    @IBOutlet weak var num3: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var codeSend: UIButton!
    @IBOutlet weak var num1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        edit(sender: codeSend)
        num1.addTarget(self, action: #selector(textdidchange), for: .editingChanged)
        num2.addTarget(self, action: #selector(textdidchange), for:
                .editingChanged)
        num3.addTarget(self, action: #selector(textdidchange), for: .editingChanged)
        num4.addTarget(self, action: #selector(textdidchange), for: .editingChanged)
        
        num1.delegate = self
        num2.delegate = self
        num3.delegate = self
        num4.delegate = self
        
        
        
        
        
    }
    
    func startTimer(){
        mytimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRunning), userInfo: nil, repeats: true)
        
    }
    @objc func timerRunning(){
        timerleft = (timerleft - 1)
        TimerLbl.text = "\(timerleft):00"
        if timerleft == 0 {
            mytimer.invalidate()
            timerleft = 50
            TimerLbl.text = ""
            
        }
        
    }
    @objc   func textdidchange(textfield : UITextField){
        let text = textfield.text
        if text?.count == 1{
            switch textfield {
            case num1:
                num2 .becomeFirstResponder()
            case num2:
                num3.becomeFirstResponder()
            case num3:
                num4.becomeFirstResponder()
            case num4:
                num4 .resignFirstResponder()
            default:
                break
            }
        }
        if text?.count == 0{
            switch textfield {
            case num1:
                num1.becomeFirstResponder()
            case num2:
                num1.becomeFirstResponder()
            case num3:
                num2.becomeFirstResponder()
            case num4:
                num3.becomeFirstResponder()
                
            default:
                break
            }
        }
    }
    
    
    
    @IBAction func backBtn2(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetTimer2(_ sender: UIButton) {
        if timerleft == 0{
            TimerLbl.text = ""
            startTimer()
        }else if timerleft != 0{
            view.endEditing(true)
        }
    }
    
    @IBAction func OtpSender(_ sender: UIButton) {
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
}
