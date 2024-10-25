//
//  newLoginViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 17/02/2024.
//

import UIKit

class newLoginViewController: UIViewController {
    weak var activImg:UIImageView? = nil
    var tag1 = false
    var tage1 = false
    let imageYear = UIImageView()
    var countrytxt3 = UITextField()
    var pickerBTN = UIButton()
    var countryCodes = [[String]]()
    var picker = UIPickerView()
    var PickerYear = UIPickerView()
    var currentIndex = 0
    var yearArr = ["المرحلة الثانوية "," المرحلة الاعدادية"," المرحلة الابتدائية"]
   
    @IBOutlet weak var profilepict: UIImageView!
    @IBOutlet weak var next6: UIButton!
    @IBOutlet weak var check: UIButton!
    @IBOutlet weak var certainPassword: UITextField!
    @IBOutlet weak var imgProfile: UIButton!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var yearstudy: UITextField!
    @IBOutlet weak var imagepicker: UIImageView!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagepicker.layer.cornerRadius = 20
        profilepict.layer.cornerRadius = 20
        nameTxt.delegate = self
        number.delegate = self
        yearstudy.delegate = self
        Password.delegate = self
        certainPassword.delegate = self
        edit(sender: next6)
      
        
        
        nameTxt.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        nameTxt.rightViewMode = .always
        number.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        number.rightViewMode = .always
        yearstudy.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        yearstudy.rightViewMode = .always
        Password.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        Password.rightViewMode = .always
        certainPassword.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        certainPassword.rightViewMode = .always
        countrytxt3.frame = CGRect(x: 0, y: 4, width: 50, height: 50)
        countrytxt3.placeholder = " +971 "
        countrytxt3.textAlignment = .right
        number.leftViewMode = .always
        number.addSubview(countrytxt3)
        rightline(frame: CGRect(x: 63, y:9, width: 2, height: (number.frame.height)/2), textfield: countrytxt3)
       
        imageYear.image = UIImage(named: "Icon ionic-ios-arrow-back")
        let connentView2 = UIView()
        connentView2.addSubview(imageYear)
        connentView2.frame = CGRect(x: 0, y: 0, width: CGFloat(Int(UIImage(named: "Icon ionic-ios-arrow-back")!.size.width)), height: (UIImage(named: "Icon ionic-ios-arrow-back")?.size.height)!)
        imageYear.frame = CGRect(x: 10, y: 0, width: CGFloat(Int(UIImage(named: "Icon ionic-ios-arrow-back")!.size.width)), height: (UIImage(named: "Icon ionic-ios-arrow-back")?.size.height)!)
        yearstudy.leftView = connentView2
        yearstudy.leftViewMode = .always
        yearstudy.inputView = PickerYear
        
        let tapp = UITapGestureRecognizer(target: self, action: #selector(handelselected))
        imagepicker.isUserInteractionEnabled = true
        imagepicker.addGestureRecognizer(tapp)
        
        
        creatToolBar()
        self.countryCodes = getAllCountryCodes()
        editepicker()
        
        
    }
    @objc func handelselected( sender: UIGestureRecognizer){
        
        guard let sendimg = sender.view as? UIImageView else {
            return
        }
        activImg = sendimg
        showAlert()
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
    
    
    func getAllCountryCodes() -> [[String]] {
        var countrys = [[String]]()
        let countryList = GlobalConstants.Constants.codePrefixes
        for item in countryList {
            countrys.append(item.value)
        }
        let sorted = countrys.sorted(by: {$0[0] < $1[0]})
        return sorted
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
        countrytxt3.inputAccessoryView = toolbar
        yearstudy.inputAccessoryView = toolbar
    }
    @objc func donebuttonPreesed(){
        
        view.endEditing(true)
    }
    @objc func CancelButtonPreesed(){
        countrytxt3.text = ""
        view.endEditing(true)
    }
    func editepicker(){
        PickerYear.delegate = self
        PickerYear.delegate = self
        PickerYear.tag = 2
        picker.delegate = self
        picker.dataSource = self
        picker.tag = 1
        countrytxt3.inputView = picker
        picker.selectRow(0, inComponent: 0, animated: true)
    }

    func rightline(frame: CGRect, textfield:UITextField){
        let rightline = CALayer()
        rightline.frame = frame
        rightline.backgroundColor = UIColor.lightGray.cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(rightline)
    }
   
    @IBAction func sheetREport(_ sender: Any) {
        let sheetrepresention = storyboard?.instantiateViewController(withIdentifier: "sheetView") as! ReportViewController
        present(sheetrepresention, animated: true)
    }
    @IBAction func btnAlerImg(_ sender: Any) {
        showAlert()
        
    }
    @IBAction func back99(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func checkBtn(_ sender: Any) {
        if tag1 == false{
            check.setImage(UIImage(named: "check_box_active"), for: UIControl.State.normal)
            tag1 = true
            
        }else if tag1 == true{
            check.setImage(UIImage(named: "check_box"), for: UIControl.State.normal)
            tag1 = false
        }
    }
    
    @IBAction func nextBTN(_ sender: Any) {
    }
    @IBAction func haveBTN(_ sender: Any) {
    }
}
extension newLoginViewController: UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
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
                countrytxt3.text = "+\(code[1])"
            case 2:
                yearstudy.text = yearArr[row]
                currentIndex = row
            default:
                printContent("error")
            }
           
        }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTxt{
            view.endEditing(true)
        }else if textField == number{
            view.endEditing(true)       
        }else if textField == yearstudy{
            view.endEditing(true)
        }else if textField == Password{
            view.endEditing(true)
        }else if textField == certainPassword{
            view.endEditing(true)
        }
        return true
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        if   let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage  {
         activImg!.image = image
       
        }
       
       
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
}
