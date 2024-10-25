//
//  chatMenuViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 08/03/2024.
//

import UIKit

class chatMenuViewController: UIViewController {
    var arr = [content]()
    @IBOutlet weak var chat: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chat.delegate = self
        chat.dataSource = self
        
        arr.append(content(imagw: UIImage(named: "imagem,")!, nam: "محمد علي"))
        arr.append(content(imagw: UIImage(named: "image")!, nam: "محمد علي"))
        arr.append(content(imagw: UIImage(named: "imagem,")!, nam: "محمد علي"))
        arr.append(content(imagw: UIImage(named: "image")!, nam: "محمد علي"))
        arr.append(content(imagw: UIImage(named: "imagem,")!, nam: "محمد علي"))
      
    }
    

    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension chatMenuViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chatMenu", for: indexPath) as! chatMenuCollectionViewCell
        let data = arr[indexPath.row]
        cell.setData(photo: data.imagw, namePers: data.nam)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: chat.frame.width, height: 114)
    }
    
    
}
struct content{
    var imagw : UIImage
    var nam : String
}
