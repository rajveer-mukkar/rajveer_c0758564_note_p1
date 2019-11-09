//
//  NewFolderTableViewController.swift
//  rajveer_c0758564_note_p1
//
//  Created by Rajveer Kaur on 2019-11-07.
//  Copyright © 2019 Rajveer Kaur. All rights reserved.
//

import UIKit

class NewFolderTableViewController: UITableViewController {
    
//    @IBOutlet weak var folderlabel: UILabel!
    
//    @IBOutlet weak var FolderIconImage: UIImageView!
    var fieldOfText:UITextField?
    var imageView : UIImage?
    var array_folder : [String]?
    
    
    @IBOutlet var tableViewData: UITableView!
    
    @IBAction func NewFolderButton(_ sender: UIBarButtonItem) {
    
    
   
        let alertcontroller = UIAlertController(title: "New Folder", message: "Enter a name for this folder.", preferredStyle: .alert)
               alertcontroller.addTextField {
                   (textField) in textField.text = ""
               }
               
                      let okAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let AddItemAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let txtField = alertcontroller.textFields![0]
            self.array_folder!.append(txtField.text!)
            print(self.array_folder!)
            self.tableViewData.reloadData()
        }
                      
                      alertcontroller.addAction(okAction)
               alertcontroller.addAction(AddItemAction); self.present(alertcontroller, animated: true, completion: nil)
           
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
                array_folder = []
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array_folder?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...

//           guard array_folder != nil else { return UITableViewCell() }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "id"){
                let folderName = array_folder![indexPath.row]
               cell.textLabel?.text = folderName
        cell.imageView?.image = UIImage(named: "folder-icon")
               return cell
                                 
        }
        return UITableViewCell()
    }


//
//    // Override to support conditional editing of the table view.
//func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//
//
//
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array_folder?.remove(at: indexPath.row)
            tableViewData.reloadData()
            
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
// removing delete in edit option
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return tableViewData.isEditing ? .none : .delete
    }
//
//
//    // Override to support rearranging the table view.
//func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//
//
//
//    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
       return true
   }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array_folder?[sourceIndexPath.row]
//        guard let item = array_folder?[sourceIndexPath.row] else { return array_folder }
        array_folder?.remove(at: sourceIndexPath.row)
        array_folder?.insert(item!, at: destinationIndexPath.row)
    }
//


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}


