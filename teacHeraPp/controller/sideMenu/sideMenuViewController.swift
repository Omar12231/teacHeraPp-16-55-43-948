//
//  sideMenuViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 01/03/2024.
//

import UIKit

class sideMenuViewController: UIViewController {
var arrItems = [Menu]()

    @IBOutlet weak var MenuCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuCollection.dataSource = self
        MenuCollection.delegate = self
        arrItems.append(Menu(imag: UIImage(named: "home_menu")!, text: "الرئيسية", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "profile_menu")!, text: "الملف الشخصي", photo: UIImage(named:  "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "myorders_menu 1")!, text: "الطلبات", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "myorders_menu")!, text: "المهام الدراسية", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "vaht_menu")!, text: "المحادثة", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "vaht")!, text: "الاشعارات", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "subscribe")!, text: "تجديد الاشعارات", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "about")!, text: "من نحن", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "about2")!, text: "الشروط والاحكام", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "subscribe_menu")!, text: "اتصل بنا", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
        arrItems.append(Menu(imag: UIImage(named: "exit_")!, text: "تسجبل الخروج", photo: UIImage(named: "Icon ionic-ios-arrow-back")!))
     
        
    }
    
    



}
extension sideMenuViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func selectRow(_row: Int){
        switch _row {
        case 0:
            navigationController?.popViewController(animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "orifikePage") as! profileViewController
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc5 = storyboard?.instantiateViewController(withIdentifier: "orderVC") as! orderViewController
            navigationController?.pushViewController(vc5, animated: true)
        case 3:
            let vc1 = storyboard?.instantiateViewController(withIdentifier: "taskVC") as! 
            tasksViewController
            navigationController?.pushViewController(vc1, animated: true)
        case 4:
            let vc4 = storyboard?.instantiateViewController(withIdentifier: "xchate") as!
            chatMenuViewController
            navigationController?.pushViewController(vc4, animated: true)
        case 5:
            let vc2 = storyboard?.instantiateViewController(withIdentifier: "notiView") as! notiificationViewController
            navigationController?.pushViewController(vc2, animated: true)
        case 6:
            let vc6 = storyboard?.instantiateViewController(withIdentifier: "backagVC") as! bakaViewController
            navigationController?.pushViewController(vc6, animated: true)
        case 7:
            let vc7 = storyboard?.instantiateViewController(withIdentifier: "whoVc") as! whoViewController
            navigationController?.pushViewController(vc7, animated: true)
        case 8:
            let vc8 = storyboard?.instantiateViewController(withIdentifier: "aboutVc") as! aboutViewController
            navigationController?.pushViewController(vc8, animated: true)
        case 9:
            let vc9 = storyboard?.instantiateViewController(withIdentifier: "callVc") as! callUSViewController
            navigationController?.pushViewController(vc9, animated: true)
        case 10:
            let vce = storyboard?.instantiateViewController(withIdentifier: "signVc") as! sinOutViewController
            navigationController?.pushViewController(vce, animated: true)
        default:
            printContent("error")
        }
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itrmCell", for: indexPath) as! MenuCollectionViewCell
        let data = arrItems[indexPath.row]
        cell.setUoItems(photo: data.imag, text: data.text, const: data.photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectRow(_row:indexPath.row)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.popViewController(animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "itemFooter", for: indexPath) as! footerCollectionReusableView
        footer.bottomLine(frame: CGRect(x: 60, y: 15, width: 265, height: 1))
        return footer
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MenuCollection.frame.width, height: 40)
    }
    
    
}
struct Menu{
    var imag: UIImage
    var text: String
    var photo: UIImage
}
