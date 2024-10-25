//
//  bakaViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 13/03/2024.
//

import UIKit

class bakaViewController: UIViewController {
var arr = [array]()
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        arr.append(array(name: "الباقة الاسبوعية", time:"د س25"))
        arr.append(array(name: "الباقة الشهرية", time:"د س25"))
        arr.append(array(name: "الباقة الفصلبة", time:"د س25"))

    }
    @IBAction func next(_ sender: UIButton) {
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension bakaViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bakaCell", for: indexPath) as! backsCollectionViewCell
        let data = arr[indexPath.row]
        cell.setData(name: data.name, data: data.time)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 131)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? backsCollectionViewCell
        cell?.backgroundColor = .white
        cell?.layer.cornerRadius = 15
        cell?.layer.borderWidth = 1
        cell?.layer.borderColor = CGColor(red: 48/255, green: 68/255, blue: 137/255, alpha: 1)
      
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? backsCollectionViewCell
        cell?.backgroundColor = UIColor(cgColor: CGColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1))
        cell?.layer.cornerRadius = 15
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = .none
    }
    
}
struct array{
    var name:String
    var time:String
    
    
    
}
