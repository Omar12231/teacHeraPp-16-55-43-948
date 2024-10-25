//
//  transferViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 21/02/2024.
//

import UIKit

class transferViewController: UIViewController {
    var tonextAlert:popup!
    var currencyTXT = UITextField()
    var iconClick = true
    let currency = UIPickerView()
    let bankPic = UIPickerView()
    
    var curr = ["ريال","دولار","دينار","درهم "]
    var bankArr = ["البنك الاهلي","بنك سامبا","بنك مصر"]
    var currentindex = 0
    @IBOutlet weak var btnSEND: UIButton!
    @IBOutlet weak var imgTrans: UIImageView!
    @IBOutlet weak var client: UITextField!
    @IBOutlet weak var dateTrans: UITextField!
    @IBOutlet weak var numTrans: UITextField!
    @IBOutlet weak var moneyTrans: UITextField!
    @IBOutlet weak var BankName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        spaceText(textfield: BankName)
        spaceText(textfield: moneyTrans)
        spaceText(textfield: numTrans)
        spaceText(textfield: dateTrans)
        spaceText(textfield: client)
        BankName.delegate = self
        moneyTrans.delegate = self
        numTrans.delegate = self
        dateTrans.delegate = self
        client.delegate = self
        editCurPic()
        BankName.inputView = bankPic
        bankPic .delegate = self
        bankPic .dataSource = self
        bankPic.tag = 3
        // button editting
        btnSEND.backgroundColor = UIColor(cgColor: CGColor(red: 154/255, green: 188/255, blue: 216/255, alpha: 1))
        btnSEND.tintColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectKInd))
        BankName.isUserInteractionEnabled = true
        BankName.addGestureRecognizer(tapGesture)
        currencyTXT.frame = CGRect(x: 0, y: 0, width: 60, height: 50)
        currencyTXT.placeholder = "العملة"
        currencyTXT.font = UIFont(name: "body", size: 9.0)
        currencyTXT.textAlignment = .right
        moneyTrans.leftViewMode = .always
        moneyTrans.addSubview(currencyTXT)
        rightline(frame: CGRect(x: 66, y:10, width: 2, height: (moneyTrans.frame.height)/2), textfield: currencyTXT)
        let tapp = UITapGestureRecognizer(target: self, action: #selector(handelselected1))
        imgTrans.isUserInteractionEnabled = true
        imgTrans.addGestureRecognizer(tapp)
       creatToolBar(textField: moneyTrans)
        creatToolBar(textField: BankName)
    }
    @objc func handelselected1(){
        showAlert()
    }
    
    func editCurPic(){
         currency .delegate = self
        currency .dataSource = self
        currencyTXT.inputView = currency
        currency.tag = 2
        
       
    }
    func showAlert(){
       let alert = UIAlertController(title: "Take Photo from", message: nil, preferredStyle: .actionSheet)
       alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
           self.getPhoto(type: .camera)
       }))
       alert.addAction(UIAlertAction(title: "Photo Libriary", style: .default, handler: { action in
           self.getPhoto(type: .photoLibrary)
       }))
       alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
       present(alert, animated: true, completion: nil)
   }
   func getPhoto(type: UIImagePickerController.SourceType){
       let pickerPhoto = UIImagePickerController()
       pickerPhoto.sourceType = type
       pickerPhoto.allowsEditing = true
       pickerPhoto.delegate = self
       present(pickerPhoto, animated: true, completion: nil)
   
       
   }
    @objc func ditBankPic(){
        bankPic .delegate = self
        bankPic .dataSource = self
        bankPic.tag = 3
    }
    @objc func donebuttonPreesed(){
        BankName.text = bankArr[currentindex]
        view.endEditing(true)
    }
    @objc func CancelButtonPreesed(){
        BankName.text = ""
        view.endEditing(true)
    }
    @objc func donebuttonPreesed2(){
        currencyTXT.text = curr[currentindex]

        view.endEditing(true)
    }
    @objc func CancelButtonPreesed2(){
        currencyTXT.text = ""
        view.endEditing(true)
    } 
    func creatToolBar(textField:UITextField){
        let textField = textField
        if textField == BankName{
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donebuttonPreesed))
            let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CancelButtonPreesed))
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            toolbar.setItems([cancelBtn,space,doneBtn], animated: true)
            doneBtn.tintColor = .black
            cancelBtn.tintColor = .red
            BankName.inputAccessoryView = toolbar
        }else{
            let toolbar2 = UIToolbar()
            toolbar2.sizeToFit()
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donebuttonPreesed2))
            let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CancelButtonPreesed2))
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            toolbar2.setItems([cancelBtn,space,doneBtn], animated: true)
            doneBtn.tintColor = .black
            cancelBtn.tintColor = .red
            currencyTXT.inputAccessoryView = toolbar2
        }
    }
    func rightline(frame: CGRect, textfield:UITextField){
        let rightline = CALayer()
        rightline.frame = frame
        rightline.backgroundColor = UIColor.lightGray.cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(rightline)
    }
    @objc func selectKInd(tappgest: UITapGestureRecognizer){
        ditBankPic()
            if iconClick{
//            let conntentView2 = UIView()
//            conntentView2.addSubview(imgClick)
//            conntentView2.frame = CGRect(x: 0, y: 0, width: CGFloat(Int(UIImage(named: "drob_down")!.size.width)), height: (UIImage(named: "drob_down")?.size.height)!)
//            imgClick.frame = CGRect(x: 10, y: 0, width: CGFloat(Int(UIImage(named: "drob_down")!.size.width)), height: (UIImage(named: "drob_down")?.size.height)!)
//            imgClick.image = UIImage(named: "drob_down")
//            BankName.leftView = conntentView2
//            BankName.leftViewMode = .always
//                imgClick.target(forAction: #selector(ditBankPic), withSender: self)
             ditBankPic()
            iconClick = false
            
        }else if iconClick == false{
           dismiss(animated: true)
//            imgClick.image = UIImage(named: "Icon ionic-ios-arrow-back")
//            let conntentView3 = UIView()
//            conntentView3.addSubview(imgClick)
//            conntentView3.frame = CGRect(x: 0, y: 0, width: CGFloat(Int(UIImage(named: "Icon ionic-ios-arrow-back")!.size.width)), height: (UIImage(named: "Icon ionic-ios-arrow-back")?.size.height)!)
//            imgClick.frame = CGRect(x: 10, y: 0, width: CGFloat(Int(UIImage(named: "Icon ionic-ios-arrow-back")!.size.width)), height: (UIImage(named: "Icon ionic-ios-arrow-back")?.size.height)!)
//            imgClick.target(forAction: #selector(ditBankPic), withSender: self)
//            BankName.leftView = conntentView3
//            BankName.leftViewMode = .always
            iconClick = true
        }
    }
    @IBAction func btnSEnD(_ sender: Any) {
        self.tonextAlert = popup(frame: self.view.frame, inview: self)
        self.tonextAlert.loginButton.addTarget(self, action: #selector(move1), for: .touchUpInside)
        edit(sender: tonextAlert.loginButton)
        self.view.addSubview(tonextAlert)
    }
    @objc func move1(){
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "homeView") as! HomaViewViewController
        present(vc3, animated: true)
    }
    @IBAction func bAcK(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension transferViewController:UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        if let img = info[.originalImage] as? UIImage{
            imgTrans.image = img
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 3:
            return bankArr.count
        case 2:
            return curr.count
        default:
            return 6
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 3:
            return bankArr[row]
        case 2:
            return curr[row]
        default:
            return "no data"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 3:
            BankName.text = bankArr[row]
            currentindex = row
            iconClick = true
        case 2:
            currencyTXT.text = curr[row]
            currentindex = row
        default:
            print ("error")
        }
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == BankName{
            view.endEditing(true)
        }else if textField == moneyTrans{
            view.endEditing(true)
        }else if textField == dateTrans{
            view.endEditing(true)
        }else if textField == client{
            view.endEditing(true)
        }else if textField == numTrans{
            view.endEditing(true)
        }
        return true
    }
    
}
