//
//  button.swift
//  teacHeraPp
//
//  Created by Macintosh on 12/02/2024.
//

import Foundation
import UIKit
func edit(sender : UIButton){
    
    sender.layer.cornerRadius = 25
    sender.backgroundColor = UIColor(cgColor: CGColor(red: 154/255, green: 188/255, blue: 216/255, alpha: 1))
    sender.tintColor = .white
}
func bottomLine(frame: CGRect,view:UIView ){
    let bottom = CALayer()
    bottom.frame = frame
    bottom.backgroundColor = UIColor.lightGray.cgColor
    view.layer.addSublayer(bottom)
}
func formatter( mask : String , phoneNumber : String) ->String {
    let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "",options: .regularExpression)
    var result: String = ""
    var index = number.startIndex
    for chacracter in mask where index < number.endIndex{
        if index == number.endIndex{
            
            break
        }
        if chacracter == "X"{
            result.append(number[index])
            index = number.index(after: index)
            
        }else{
            result.append( chacracter)
        }
    }
    return result
}
func spaceText(textfield:UITextField){
    textfield.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
    textfield.rightViewMode = .always
}
func setlayout( collectionView: UICollectionView){
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 5
    layout.minimumInteritemSpacing = 0
    collectionView.collectionViewLayout = layout
}
//switch indexPath.row {
//case 0:
//    let cell = collectionView . dequeueReusableCell(withReuseIdentifier: "contenntCelll", for: indexPath) as! conTypCollectionViewCell
//    let data = RRa[indexPath.row]
//    cell.setData(name1: data.name2, rev: data.rev)
//    cell.layer.cornerRadius = 10
//    cell.review.textColor = UIColor(cgColor: CGColor(red: 154/255, green: 188/255, blue: 216/255, alpha: 1))
//    cell.review.layer.borderColor =  CGColor(red: 154/255, green: 188/255, blue: 216/255, alpha: 1)
//    cell.backgroundColor = .txtcolor
//    Collection.reloadData()
//    return cell
//case 1:
//    let cell = collectionView . dequeueReusableCell(withReuseIdentifier: "contenntCelll", for: indexPath) as! conTypCollectionViewCell
//    let data = rra[indexPath.row]
//    cell.setData(name1: data.name2, rev: data.rev)
//    cell.layer.cornerRadius = 10
//    cell.review.textColor = UIColor(cgColor: CGColor(red: 225/255, green: 159/255, blue: 27/255, alpha: 1))
//    cell.review.layer.borderColor = CGColor(red: 225/255, green: 159/255, blue: 27/255, alpha: 1)
//    cell.backgroundColor = .txtcolor
//    Collection.reloadData()
//    return cell
//case 2:
//    let cell = collectionView . dequeueReusableCell(withReuseIdentifier: "contenntCelll", for: indexPath) as! conTypCollectionViewCell
//    let data = curr[indexPath.row]
//    cell.setData(name1: data.name2, rev: data.rev)
//    cell.layer.cornerRadius = 10
//    cell.review.textColor = UIColor(cgColor: CGColor(red: 225/255, green: 159/255, blue: 27/255, alpha: 1))
//    cell.review.layer.borderColor =  CGColor(red: 225/255, green: 159/255, blue: 27/255, alpha: 1)
//    cell.backgroundColor = .txtcolor
//    Collection.reloadData()
//    return cell
//case 3:
//    let cell = collectionView . dequeueReusableCell(withReuseIdentifier: "contenntCelll", for: indexPath) as! conTypCollectionViewCell
//    let data = end[indexPath.row]
//    cell.setData(name1: data.name2, rev: data.rev)
//    cell.layer.cornerRadius = 10
//    cell.review.textColor = UIColor.black
//    cell.review.layer.borderColor = UIColor.black.cgColor
//    cell.backgroundColor = .txtcolor
//    Collection.reloadData()
//    return cell
//case 4:
//    let cell = collectionView . dequeueReusableCell(withReuseIdentifier: "contenntCelll", for: indexPath) as! conTypCollectionViewCell
//    let data = refus[indexPath.row]
//    cell.setData(name1: data.name2, rev: data.rev)
//    cell.layer.cornerRadius = 10
//    cell.review.textColor = UIColor.red
//    cell.review.layer.borderColor = UIColor.red.cgColor
//    cell.backgroundColor = .txtcolor
//    Collection.reloadData()
//    return cell
//default:
//    let cell = collectionView . dequeueReusableCell(withReuseIdentifier: "contenntCelll", for: indexPath) as! conTypCollectionViewCell
//    let data = RRa[indexPath.row]
//    cell.setData(name1: data.name2, rev: data.rev)
//    cell.layer.cornerRadius = 10
//    cell.review.textColor = UIColor(cgColor: CGColor(red: 154/255, green: 188/255, blue: 216/255, alpha: 1))
//    cell.review.layer.borderColor =  CGColor(red: 154/255, green: 188/255, blue: 216/255, alpha: 1)
//    cell.backgroundColor = .txtcolor
//    Collection.reloadData()
//    return cell
//}




   


