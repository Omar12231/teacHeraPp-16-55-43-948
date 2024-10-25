//
//  PayViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 21/02/2024.
//

import UIKit

class PayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
   
    
    
    @IBOutlet weak var tableView: UITableView!
    var cellarr = [cellelements]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        cellarr.append(cellelements.init(image: UIImage(named: "ahli")!, nameOfBank: "البنك الاهلي", num: " رقم الأيبان:3 000 111 22 544536 756", acc: "  رقم الحساب: 123 000 111 22 546 789 ", client: "رضا احمد"))
        cellarr.append(cellelements.init(image: UIImage(named: "samp")!, nameOfBank: "بنك سامبا", num: " رقم الأيبان:3 000 111 22 544536 756", acc: "  رقم الحساب: 123 000 111 22 546 789 ", client: "رضا احمد"))
        cellarr.append(cellelements.init(image: UIImage(named: "ahli")!, nameOfBank: "البنك الاهلي", num: " رقم الأيبان:3 000 111 22 544536 756", acc: "  رقم الحساب: 123 000 111 22 546 789 ", client: "رضا احمد"))
    
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayCell") as! PayCellTableViewCell
        let data = cellarr[indexPath.row]
        cell.setUpcell(photo: data.image, name: data.nameOfBank, name2: data.client, namer3: data.num, name4: data.acc)
        cell.backgroundColor = UIColor(cgColor: CGColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1))
        cell.layer.cornerRadius = 15
        let backgroundColor = UIView()
        backgroundColor.backgroundColor = .white
        backgroundColor.layer.cornerRadius = 15
        backgroundColor.layer.borderWidth = 1
        backgroundColor.layer.borderColor = CGColor(red: 48/255, green: 68/255, blue: 137/255, alpha: 1)
        cell.selectedBackgroundView = backgroundColor
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellarr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 139
    }
    
    @IBAction func backCell(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    

}
struct cellelements{
    var image:UIImage
    var nameOfBank:String
    var num:String
    var acc:String
    var client:String
}
