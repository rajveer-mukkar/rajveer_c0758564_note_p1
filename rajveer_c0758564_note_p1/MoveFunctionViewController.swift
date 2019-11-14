//
//  MoveFunctionViewController.swift
//  rajveer_c0758564_note_p1
//
//  Created by Rajveer Kaur on 2019-11-14.
//  Copyright © 2019 Rajveer Kaur. All rights reserved.
//

import UIKit

class MoveFunctionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var notes : FoldersPageTableViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array_Folder.Folder_array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
        cell.textLabel?.text = array_Folder.Folder_array[indexPath.row].name_of_folder
        return cell
    }
    
    @IBAction func cancel_button(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let my_alert = UIAlertController (title: "Move To\(array_Folder.Folder_array[indexPath.row].name_of_folder)", message: "Are You Sure", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        let moveAction = UIAlertAction(title: "Move", style: .default) { (action) in
            self.notes?.notes_moved(index : indexPath.row)
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
            my_alert.addAction(noAction)
            my_alert.addAction(moveAction)
            self.present(my_alert , animated: true , completion: nil)
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
