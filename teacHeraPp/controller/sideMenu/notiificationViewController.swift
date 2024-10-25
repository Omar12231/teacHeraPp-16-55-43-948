//
//  notiificationViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 06/03/2024.
//

import UIKit

class notiificationViewController: UIViewController {
var arr = [arary]()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableview.delegate = self
        tableview.dataSource = self
        arr.append(arary(photo: UIImage(named: "noun_accept_2162464")!, date: "21 / 2/2023 ", ask: "طلب اشتراك جديد", con: "عمر عمر"))
        arr.append(arary(photo: UIImage(named: "noun_accept_2162464")!, date: "21 / 2/2023 ", ask: "طلب اشتراك جديد", con: "عمر عمر"))
        arr.append(arary(photo: UIImage(named: "noun_accept_2162464")!, date: "21 / 2/2023 ", ask: "طلب اشتراك جديد", con: "عمر عمر"))
        arr.append(arary(photo: UIImage(named: "noun_accept_2162464")!, date: "21 / 2/2023 ", ask: "طلب اشتراك جديد", con: "عمر عمر"))
      
    }
    

    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
extension notiificationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView . dequeueReusableCell(withIdentifier: "notiCell", for: indexPath) as! contenTableViewCell
        let data = arr[indexPath.row]
        cell.setCon(photo: data.photo, date: data.date, con: data.con, ask: data.ask)
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 139
    }
    
    
}
struct arary{
    var photo:UIImage
    var date : String
    var ask: String
    var con : String
}
