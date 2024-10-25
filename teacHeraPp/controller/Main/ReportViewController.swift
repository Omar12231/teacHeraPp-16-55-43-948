//
//  ReportViewController.swift
//  teacHeraPp
//
//  Created by Macintosh on 19/02/2024.
//

import UIKit

class ReportViewController: UIViewController,UISheetPresentationControllerDelegate {
    @IBOutlet weak var contectLbl: UILabel!
    @IBOutlet weak var accept: UIButton!
    override var sheetPresentationController: UISheetPresentationController?{
        presentationController as? UISheetPresentationController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contectLbl.text =  "\u{2022} المحتوي"
        sheetPresentationController?.preferredCornerRadius = 15
        sheetPresentationController?.delegate = self
      //  sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.detents = [.custom(resolver: { context in
            0.9*context.maximumDetentValue
        }),.large()]
    }
    
    @IBAction func acceptBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
