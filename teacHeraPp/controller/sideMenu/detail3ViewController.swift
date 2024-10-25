//
//  detail3ViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 13/03/2024.
//

import UIKit

class detail3ViewController: UIViewController {

    @IBOutlet weak var imagBtn: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(setup))
        imagBtn.addGestureRecognizer(tap)
    }
    @objc func setup(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
    }
    

}
