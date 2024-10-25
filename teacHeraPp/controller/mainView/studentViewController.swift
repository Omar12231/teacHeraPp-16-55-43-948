//
//  studentViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 26/02/2024.
//

import UIKit

class studentViewController: UIViewController {
var arrStudents = [arrStu]()
    @IBOutlet weak var studentCollection: UICollectionView!
    @IBOutlet weak var searchTxt: UITextField!
    var imagSearch2 = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        studentCollection.delegate = self
        studentCollection.dataSource = self
        arrStudents.append(arrStu(name: "محمد علي" ,state: "المرحلخة الابتدائية", img: UIImage(named: "Path 36604")!, img1: UIImage(named: "image")!))
        arrStudents.append(arrStu(name: "هلا" ,state: "المرحلخة الابتدائية", img: UIImage(named: "Path 36604")!, img1: UIImage(named: "image")!))
        arrStudents.append(arrStu(name: "محمد مجمد" ,state: "المرحلخة الابتدائية", img: UIImage(named: "Path 36604")!, img1: UIImage(named: "image")!))
        arrStudents.append(arrStu(name: "عمر عمر" ,state: "المرحلخة الابتدائية", img: UIImage(named: "Path 36604")!, img1: UIImage(named: "image")!))
        imagSearch2.image = UIImage(named: "search")
        let contenntview = UIView()
        contenntview.addSubview(imagSearch2)
        contenntview.frame = CGRect(x: 10, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        imagSearch2.frame = CGRect(x: 0, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        searchTxt.rightView = contenntview
        searchTxt.rightViewMode = .always
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func popback(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension studentViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrStudents.count
            
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentCell", for: indexPath) as! StudentCollectionViewCell
            let data = arrStudents[indexPath.row]
            cell.dateSet(name1: data.name, photo1: data.img1, state1: data.state, photo2: data.img)
            cell.layer.cornerRadius = 10
        cell.backgroundColor = UIColor(cgColor: CGColor(red: 225/255, green: 159/255, blue: 27/255, alpha: 1))
            return cell
            
     
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 92)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 15
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? StudentCollectionViewCell
        cell?.backgroundColor = .white
        cell?.layer.cornerRadius = 15
        cell?.layer.borderWidth = 1
        cell?.layer.borderColor = CGColor(red: 48/255, green: 68/255, blue: 137/255, alpha: 1)
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? StudentCollectionViewCell
        cell?.backgroundColor = UIColor(cgColor: CGColor(red: 225/255, green: 159/255, blue: 27/255, alpha: 1))
        cell?.layer.cornerRadius = 15
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = .none
    }
    
    
}
struct arrStu{
    var name:String
    var state:String
    var img:UIImage
    var img1:UIImage
}
