//
//  chattViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 08/03/2024.
//

import UIKit

class chattViewController: UIViewController {
   
    
    
   var mess = [""]
    @IBOutlet weak var txtSender: UITextField!
    @IBOutlet weak var collectionVew: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtSender.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        txtSender.rightViewMode = .always
        collectionVew.delegate = self
        collectionVew.dataSource = self
        collectionVew.register(UINib(nibName: "SenderCollectionViewCell ", bundle: nil), forCellWithReuseIdentifier: "senderCell")
        collectionVew.register(UINib(nibName: "ReceverCollectionViewCell ", bundle: nil), forCellWithReuseIdentifier: "receCell")
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func send(_ sender: Any) {
        mess.append(txtSender.text!)
        txtSender.text = ""
        collectionVew.reloadData()
    }
    
}
extension chattViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mess.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionVew.dequeueReusableCell(withReuseIdentifier: "senderCell", for: indexPath) as! SenderCollectionViewCell
        cell.labelSen.text = mess[indexPath.row]
        return cell
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mess.append(txtSender.text!)
        txtSender.text = ""
        collectionVew.reloadData()
       
        view.endEditing(true)
        return true
    }
    
    
}
    

