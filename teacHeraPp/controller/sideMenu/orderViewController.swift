//
//  orderViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 08/03/2024.
//

import UIKit

class orderViewController: UIViewController {
    var arr = [" قيد المراجعة","قيد الدفع","حالي","منتهي","ملغي"]
    var RRa = [con]()
    var rra = [con]()
    var curr = [con]()
    var refus = [con]()
    var end = [con]()
    lazy var emptyARR = RRa
    var index = 0
     

    @IBOutlet weak var Collection: UICollectionView!
    @IBOutlet weak var typesCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        typesCollection.transform = CGAffineTransform(scaleX: -1, y: 1)
        Collection.delegate = self
        Collection.dataSource = self
        typesCollection.delegate = self
        typesCollection.dataSource = self
        RRa.append(con(name2: "محمد علي محمد", rev: "قيد المراجعة"))
        RRa.append(con(name2: "محمد علي محمد", rev: "قيد المراجعة"))
        RRa.append(con(name2: "محمد علي محمد", rev: "قيد المراجعة"))
        rra.append(con(name2: "محمد علي محمد", rev: "قيد الدفع"))
        rra.append(con(name2: "محمد علي محمد", rev: "قيد الدفع"))
        rra.append(con(name2: "محمد علي محمد", rev: "قيد الدفع"))
        curr.append(con(name2: "محمد علي محمد", rev: "حالي"))
        curr.append(con(name2: "محمد علي محمد", rev: "حالي"))
        curr.append(con(name2: "محمد علي محمد", rev: "حالي"))
        end.append(con(name2: "محمد علي محمد", rev: "الطلب منتهي"))
        end.append(con(name2: "محمد علي محمد", rev: "الطلب منتهي"))
        end.append(con(name2: "محمد علي محمد", rev: "الطلب منتهي"))
        refus.append(con(name2: "محمد علي محمد", rev: "الطلب ملغي"))
        refus.append(con(name2: "محمد علي محمد", rev: "الطلب ملغي"))
        refus.append(con(name2: "محمد علي محمد", rev: "الطلب ملغي"))

    }
    
   
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension orderViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == typesCollection{
            typesCollection.reloadData()
            return arr.count
        }else{
            return emptyARR.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == typesCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typesCell", for: indexPath) as! typesCollectionViewCell
            cell.typeslbl.text = arr[indexPath.row]
            cell.layer.cornerRadius = 10
            cell.backgroundColor = .txtcolor
            if indexPath.row == index {
                cell .typeslbl.backgroundColor = UIColor.red
            }else{
                cell .typeslbl.backgroundColor = UIColor.blue
            }
            cell.transform = CGAffineTransform(scaleX: -1, y: 1)
            return cell
            
        }else{
            let cell = collectionView . dequeueReusableCell(withReuseIdentifier: "contenntCelll", for: indexPath) as! conTypCollectionViewCell
            let data = emptyARR[indexPath.row]
            cell.setData(name1: data.name2, rev: arr[index])
            switch index {
            case 0:
                cell.review.textColor = UIColor.red
            case 1:
                cell.review.textColor = UIColor.blue
                
            default:
                cell.review.textColor = UIColor.red
            }
            cell.layer.cornerRadius = 10
            cell.backgroundColor = .txtcolor
            return cell
        }

    }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       if collectionView == Collection{
           return 15
       }else{
           return 15
       }
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == typesCollection{
            return 10
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == Collection{
            return CGSize(width: 360, height: 131)
        }else{
            return CGSize(width: arr[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]).width+25, height:30)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == typesCollection{
            index = indexPath.row
            Collection.reloadData()
            typesCollection.reloadData()
        }
        
        
        
        
        }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == typesCollection{
            let cell = collectionView.cellForItem(at: indexPath) as! typesCollectionViewCell
            cell.backgroundColor = .txtcolor
            cell.typeslbl.textColor = UIColor(cgColor: CGColor(red: 63/255, green: 63/255, blue: 63/255, alpha: 1))
        }else if collectionView == Collection{
            let cell2 = collectionView.cellForItem(at: indexPath) as! conTypCollectionViewCell
            cell2.backgroundColor = UIColor(cgColor: CGColor(red: 225/255, green: 159/255, blue: 27/255, alpha: 1))
            cell2.layer.cornerRadius = 15
            cell2.layer.borderWidth = 0
        }
        
        
        
    }
    func setcollectionn(colletion: UICollectionView , color1:UIColor ,bordercolor: CGColor , index: IndexPath ){
        let pop = colletion.cellForItem(at: index) as! conTypCollectionViewCell
        pop.review.layer.borderColor = bordercolor
        pop.review.textColor = color1
    }
    
    
}
struct con{
    var name2:String
    var rev: String
}
