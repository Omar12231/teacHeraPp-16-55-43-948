//
//  checkNUMViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 17/02/2024.
//

import UIKit

class checkNUMViewController: UIViewController,UITextFieldDelegate {
    var mytimer : Timer!
    var timerleft = 50
    @IBOutlet weak var send5: UIButton!
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var text4: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edit(sender: send5)
        text1.addTarget(self, action: #selector(textdidchange), for: .editingChanged)
        text2.addTarget(self, action: #selector(textdidchange), for:
                .editingChanged)
        text3.addTarget(self, action: #selector(textdidchange), for: .editingChanged)
        text4.addTarget(self, action: #selector(textdidchange), for: .editingChanged)
        text1.delegate = self
        text2.delegate = self
        text3.delegate = self
        text4.delegate = self
        
    }
    func startTimer(){
        
        mytimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRunning), userInfo: nil, repeats: true)
        
    }
    @objc func timerRunning(){
        timerleft = (timerleft - 1)
        timelbl.text = "\(timerleft):00"
        if timerleft == 0 {
            mytimer.invalidate()
            timerleft = 50
            timelbl.text = ""
            
        }
        
    }
    @objc   func textdidchange(textfield : UITextField){
        let text = textfield.text
        if text?.count == 1{
            switch textfield {
            case text1:
                text2 .becomeFirstResponder()
            case text2:
                text3.becomeFirstResponder()
            case text3:
                text4.becomeFirstResponder()
            case text4:
                text4 .resignFirstResponder()
            default:
                break
            }
        }
        if text?.count == 0{
            switch textfield {
            case text1:
                text1.becomeFirstResponder()
            case text2:
                text1.becomeFirstResponder()
            case text3:
                text2.becomeFirstResponder()
            case text4:
                text4.becomeFirstResponder()
                
            default:
                break
            }
        }
    }
    
    
    @IBAction func sendBT5(_ sender: Any) {
    }
    @IBAction func sendAgain(_ sender: Any) {
        startTimer()
    }
    
    @IBAction func backBTN1(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
