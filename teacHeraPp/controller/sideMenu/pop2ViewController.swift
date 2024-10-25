//
//  pop2ViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 13/03/2024.
//

import UIKit

class pop2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func no(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func yes(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "orderVC") as! orderViewController
        navigationController?.pushViewController(vc, animated: true)
    }

  
}
