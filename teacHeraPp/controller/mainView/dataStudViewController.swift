//
//  dataStudViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 28/02/2024.
//

import UIKit

class dataStudViewController: UIViewController {
let image = UIImageView()
    @IBOutlet weak var cash: UILabel!
    @IBOutlet weak var bacNiew: UIView!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var nameStud: UILabel!
    @IBOutlet weak var upload: UIButton!
    @IBOutlet weak var chat: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      bottomLine(frame: CGRect(x:-345, y:110, width: 335, height: 1), view: bacNiew)
        
    }
   
    

    @IBAction func chatBtn(_ sender: Any) {
    }
    
    @IBAction func uploadBtn(_ sender: Any) {
    }
    
    @IBAction func backOp(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
