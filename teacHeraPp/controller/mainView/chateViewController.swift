//
//  chateViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 28/02/2024.
//

import UIKit

class chateViewController: UIViewController {
var Messages = [""]
  
    @IBOutlet weak var SendTxT: TextCustome!
    @IBOutlet weak var tableViewChat: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SendTxT.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        SendTxT.rightViewMode = .always
        tableViewChat.delegate = self
        tableViewChat.dataSource = self
        let indexpath = IndexPath(row: self.Messages.count-1, section: 0)
        if indexpath.row > 7{
            tableViewChat.scrollToRow(at: indexpath, at: .top, animated: true)
        }
        tableViewChat.register(UINib(nibName: "chat1TableViewCell", bundle: nil), forCellReuseIdentifier: "senderCell")
        tableViewChat.register(UINib(nibName: "chat2TableViewCell", bundle: nil), forCellReuseIdentifier: "recieverCell")
       
       
    }
    @IBAction func sendTxtBtn(_ sender: Any) {
        Messages.append(SendTxT.text!)
        SendTxT.text = ""
        tableViewChat.reloadData()
    }
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension chateViewController:UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "senderCell", for: indexPath) as! chat1TableViewCell
        cell.senderLbl.text = Messages[indexPath.row]
        
        
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Messages.append(SendTxT.text!)
        SendTxT.text = " "
        tableViewChat.reloadData()
       
        view.endEditing(true)
        return true
    }
}
