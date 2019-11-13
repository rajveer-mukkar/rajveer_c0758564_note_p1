//
//  showNotesViewController.swift
//  rajveer_c0758564_note_p1
//
//  Created by Rajveer Kaur on 2019-11-11.
//  Copyright © 2019 Rajveer Kaur. All rights reserved.
//

import UIKit

class showNotesViewController: UIViewController {
    var array : [String]?
    
   
    
    @IBOutlet weak var textview: UITextView!
   
        var textString : String?
        weak var taskTable:FoldersPageTableViewController?
        override func viewDidLoad() {
            super.viewDidLoad()
            
            textview.text = textString ?? ""
            // Do any additional setup after loading the view.
        }

        override func viewWillDisappear(_ animated: Bool) {

                       taskTable?.updateText(text: textview.text)


    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.

    
