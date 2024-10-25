//
//  nextViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 06/03/2024.
//

import UIKit

class nextViewController: UIViewController {

    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var stae: UILabel!
    @IBOutlet weak var subName: UILabel!
    @IBOutlet weak var studNam: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveChange(_ sender: Any) {
    }
    
}
