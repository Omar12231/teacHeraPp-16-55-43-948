import UIKit

class ViewController: UIViewController{
    var countrytxt = UITextField()
    var countryCodes = [[String]]()
    var picker = UIPickerView()
    
    
    @IBOutlet weak var PasswordText: UITextField!
    
    @IBOutlet weak var PhoneNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        creatToolBar()
        self.countryCodes = getAllCountryCodes()
        editepicker()
        PhoneNum.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        PhoneNum.rightViewMode = .always
        PasswordText.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        PasswordText.rightViewMode = .always
        countrytxt.frame = CGRect(x: 0, y:4, width: 50, height: 50)
        countrytxt.placeholder = " +971 "
        countrytxt.textAlignment = .right
        PhoneNum.leftViewMode = .always
        PhoneNum.addSubview(countrytxt)

        
        
      
        PhoneNum.delegate = self
        PasswordText.delegate = self
        rightline(frame: CGRect(x: 63, y:11, width: 2, height: (PhoneNum.frame.height)/2), textfield: countrytxt)
        
    }
       
    

    @IBAction func forgetPass(_ sender: Any) {
        
    }
    
    @IBAction func loginBTN(_ sender: Any) {
        
    }
    @IBAction func newAcc(_ sender: Any) {
        
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
        PhoneNum.becomeFirstResponder()

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
        doneBtn.tintColor = UIColor.label
        cancelBtn.tintColor = .red
        countrytxt.inputAccessoryView = toolbar
        PhoneNum.inputAccessoryView = toolbar
       
        
    }
    
    
   
    
    func editepicker(){
       
        picker.delegate = self
        picker.dataSource = self
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
   
}
extension ViewController:UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return countryCodes.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            let code = countryCodes[row]
            return "\(code[0]) +\(code[1])"
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let code = countryCodes[row]
            countrytxt.text = "+\(code[1])"
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == PhoneNum{
            PasswordText.becomeFirstResponder()
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
        if textField == PhoneNum{
          let text = PhoneNum.text
            let newString = (text! as NSString).replacingCharacters(in: range, with: string)
            PhoneNum.text = formatter(mask:"X XXXX XXXX" , phoneNumber: newString)
            
        }else{
                return true
            
        }
            
        return false
    }
    
}

