//
//  HomaViewViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 22/02/2024.
//

import UIKit

class HomaViewViewController: UIViewController {
var arrImafe = [UIImage(named: "image##"),UIImage(named: "image##"),UIImage(named: "image##"),UIImage(named: "image##")]
    var timer: Timer?
    var currentIndex = 0
    var arrstudentd = [arrCon]()
    var imagSearch = UIImageView()
    @IBOutlet weak var sideMenu: UIButton!
    @IBOutlet weak var searchTExt: UITextField!
    @IBOutlet weak var sbCollection: UICollectionView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var collectionCell: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionCell.dataSource = self
        collectionCell .delegate = self
        sbCollection.delegate = self
        sbCollection.dataSource = self
        creattimer()
        pageControll.numberOfPages = arrImafe.count
        arrstudentd.append(arrCon(name: "رياضيات" ,state: "المرحلخة الابتدائية", img: UIImage(named: "Path 36604")!, img1: UIImage(named: "Group 17905")!))
        arrstudentd.append(arrCon(name: "رياضيات" ,state: "المرحلخة الابتدائية", img: UIImage(named: "Path 36604")!, img1: UIImage(named: "Group 17905")!))
        arrstudentd.append(arrCon(name: "رياضيات" ,state: "المرحلخة الابتدائية", img: UIImage(named: "Path 36604")!, img1: UIImage(named: "Group 17905")!))
        arrstudentd.append(arrCon(name: "رياضيات" ,state: "المرحلخة الابتدائية", img: UIImage(named: "Path 36604")!, img1: UIImage(named: "Group 17905")!))
        imagSearch.image = UIImage(named: "search")
        let contenntview = UIView()
        contenntview.addSubview(imagSearch)
        contenntview.frame = CGRect(x: 10, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        imagSearch.frame = CGRect(x: 0, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
        searchTExt.rightView = contenntview
        searchTExt.rightViewMode = .always

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func creattimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(movrTONext), userInfo: self, repeats: true)
    }
    @objc func movrTONext(){
        if currentIndex < arrImafe.count-1{
            currentIndex += 1
        }else{
            currentIndex = 0
        }
        collectionCell.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControll.currentPage = currentIndex
    }
    
    @IBAction func notificationBTn(_ sender: Any) {
    }
    
  
    @IBAction func sidemenu(_ sender: Any) {
    }
    
}
extension HomaViewViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionCell:
            return arrImafe.count
        case sbCollection:
            return arrstudentd .count
        default:
            return 0
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionCell{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! homeCollectionViewCell
            cell.imagConTent.image = arrImafe[indexPath.row]
          return cell

        }else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath) as! subJCollectionViewCell
            let data = arrstudentd[indexPath.row]
            cell2.dateSet(name: data.name, photo: data.img1, state: data.state, photo2: data.img)
            cell2.layer.cornerRadius = 10
            return cell2
            
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionCell{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else{
            return CGSize(width: collectionView.frame.width, height: 92)

        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionCell{
            return 0
        }else {
            return 15
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? subJCollectionViewCell
        cell?.backgroundColor = .white
        cell?.layer.cornerRadius = 15
        cell?.layer.borderWidth = 1
        cell?.layer.borderColor = CGColor(red: 48/255, green: 68/255, blue: 137/255, alpha: 1)
        let vc = storyboard?.instantiateViewController(withIdentifier: "studentPage") as? studentViewController
        navigationController?.pushViewController( vc!, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? subJCollectionViewCell
        cell?.backgroundColor = UIColor(cgColor: CGColor(red: 225/255, green: 159/255, blue: 27/255, alpha: 1))
        cell?.layer.cornerRadius = 15
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = .none
    }
    
    
}
struct arrCon{
    var name:String
    var state:String
    var img:UIImage
    var img1:UIImage
}
