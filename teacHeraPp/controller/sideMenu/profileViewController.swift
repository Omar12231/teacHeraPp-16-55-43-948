//
//  profileViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 04/03/2024.
//

import UIKit

class profileViewController: UIViewController {
    var countrytxt = UITextField()
    var countryCodes = [[String]]()
    var picker = UIPickerView()
    var PickerYear = UIPickerView()
    var currentIndex = 0
    var yearArr = ["المرحلة الثانوية "," المرحلة الاعدادية"," المرحلة الابتدائية"]
    let imageYear = UIImageView()
    @IBOutlet weak var stateIMg: UIImageView!
    @IBOutlet weak var StagYear: UITextField!
    @IBOutlet weak var NumTxt: UITextField!
    @IBOutlet weak var namTxt: UITextField!
    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        spaceText(textfield: NumTxt)
        spaceText(textfield: namTxt)
        spaceText(textfield: StagYear)
        creatToolBar()
        self.countryCodes = getAllCountryCodes()
        editepicker()
        countrytxt.frame = CGRect(x:10, y: 9, width: 50, height: 50)
        countrytxt.placeholder = " +971 "
        countrytxt.textAlignment = .right
        NumTxt.leftViewMode = .always
        NumTxt.addSubview(countrytxt)
        NumTxt.delegate = self
        namTxt.delegate = self
        StagYear.delegate = self
        rightline(frame: CGRect(x: 63, y:7, width: 2, height: (NumTxt.frame.height)/2), textfield: countrytxt)
        imageYear.image = UIImage(named: "Icon ionic-ios-arrow-back")
        let connentView2 = UIView()
        connentView2.addSubview(imageYear)
        connentView2.frame = CGRect(x: 0, y: 0, width: CGFloat(Int(UIImage(named: "Icon ionic-ios-arrow-back")!.size.width)), height: (UIImage(named: "Icon ionic-ios-arrow-back")?.size.height)!)
        imageYear.frame = CGRect(x: 10, y: 0, width: CGFloat(Int(UIImage(named: "Icon ionic-ios-arrow-back")!.size.width)), height: (UIImage(named: "Icon ionic-ios-arrow-back")?.size.height)!)
        StagYear.leftView = connentView2
        StagYear.leftViewMode = .always
        StagYear.inputView = PickerYear
        
    }
    func getAllCountryCodes() -> [[String]] {
        var countrys = [[String]]()
        let countryList = GlobalConstants.Constants.codePrefixes
        for item in countryList {
            countrys.append(item.value)
        }
        let sorted = countrys.sorted(by: {$0[0] < $1[0]})
        return sorted
    }
    @objc func donebuttonPreesed(){
        
        NumTxt.becomeFirstResponder()

    }
    @objc func CancelButtonPreesed(){
        countrytxt.text = ""
        view.endEditing(true)
    }
    func creatToolBar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donebuttonPreesed))
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(CancelButtonPreesed))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([cancelBtn,space,doneBtn], animated: true)
        doneBtn.tintColor = .black
        cancelBtn.tintColor = .red
        countrytxt.inputAccessoryView = toolbar
       
        
    }
    
    
   
    
    func editepicker(){
        PickerYear.delegate = self
        PickerYear.delegate = self
        PickerYear.tag = 2
        picker.delegate = self
        picker.dataSource = self
        picker.tag = 1
        countrytxt.inputView = picker
        picker.selectRow(0, inComponent: 0, animated: true)
    }

    func rightline(frame: CGRect, textfield:UITextField){
        let rightline = CALayer()
        rightline.frame = frame
        rightline.backgroundColor = UIColor.lightGray.cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(rightline)
    }
   
    

    @IBAction func butnImg(_ sender: Any) {
    }
    
    @IBAction func backPOP(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func changPass(_ sender: Any) {
    }
}
extension profileViewController:UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return countryCodes.count;
        case 2:
            return yearArr.count
        default:
            return 1
        }
    }

        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            let code = countryCodes[row]
            return "\(code[0]) +\(code[1])"
        case 2:
          return  yearArr[row]
        default:
            return "no date"
        }
         
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            let code = countryCodes[row]
            countrytxt.text = "+\(code[1])"
        case 2:
            StagYear.text = yearArr[row]
            currentIndex = row
        default:
            printContent("error")
        }
       
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == namTxt{
            NumTxt.becomeFirstResponder()
        }else if textField == NumTxt{
            StagYear.becomeFirstResponder()
            
        }else{
            view.endEditing(true)
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == NumTxt{
          let text = NumTxt.text
            let newString = (text! as NSString).replacingCharacters(in: range, with: string)
            NumTxt.text = formatter(mask:"X XXXX XXXX" , phoneNumber: newString)
            
        }else{
                return true
            
        }
            
        return false
    }
    
}
