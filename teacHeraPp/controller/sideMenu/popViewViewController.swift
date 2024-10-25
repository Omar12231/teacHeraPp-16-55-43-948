//
//  popViewViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 12/03/2024.
//

import UIKit

class popViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func no(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func yes(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "orderVC") as! orderViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
