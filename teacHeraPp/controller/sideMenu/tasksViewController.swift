//
//  tasksViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 06/03/2024.
//

import UIKit

class tasksViewController: UIViewController {
 
    @IBOutlet weak var collectionData: UICollectionView!
    @IBOutlet weak var segment: UISegmentedControl!
    var arrCon = [arr]()
    var aarSend = [arr]()
    lazy var rowToDis = arrCon
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionData.reloadData()
        collectionData.dataSource = self
        collectionData.delegate = self
              let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
              segment.setTitleTextAttributes(titleTextAttributes, for:.normal)
              let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
              segment.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        segment.layer.cornerRadius = 10
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        arrCon.append(arr(name: "محمد علي", image: UIImage(named: "Group 1806")!, subject: "مادة الرياضيات"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
        aarSend.append(arr(name: "محمد محمد", image: UIImage(named: "Group 1806")!, subject: "عربي"))
    }
    
    @IBAction func egmeControl (_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0:
            self.rowToDis = arrCon
        case 1:
            self.rowToDis = aarSend
        default:
            rowToDis = aarSend
        }
        collectionData.reloadData()
    }
    
  
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension tasksViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowToDis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "importCell", for: indexPath)as! importsCellCollectionViewCell
        let data = rowToDis[indexPath.row]
        cell.setCell(photo:data.image , name: data.name, namMat: data.subject)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 162, height: 179)
    }
   
    
    
    
    
}
struct arr{
    var name: String
    var image : UIImage
    var subject: String
}
