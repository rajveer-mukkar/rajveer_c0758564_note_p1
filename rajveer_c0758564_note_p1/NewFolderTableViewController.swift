//
//  NewFolderTableViewController.swift
//  rajveer_c0758564_note_p1
//
//  Created by Rajveer Kaur on 2019-11-07.
//  Copyright © 2019 Rajveer Kaur. All rights reserved.
//

import UIKit

class NewFolderTableViewController: UITableViewController {
    

    var fieldOfText:UITextField?
    var imageView : UIImage?
   var text = ""
    var cur_index = -1
   
    @IBOutlet var tableViewData: UITableView!
    
    @IBAction func NewFolderButton(_ sender: UIBarButtonItem) {
    
    
   
        let alertcontroller = UIAlertController(title: "New Folder", message: "Enter a name for this folder.", preferredStyle: .alert)
               alertcontroller.addTextField {
                   (textField) in textField.text = ""
               }
               
                      let okAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        okAction.setValue(UIColor.brown, forKey: "titleTextColor")
    let AddItemAction = UIAlertAction(title: "Add Item", style: .default)
    { (action) in
        let name = alertcontroller.textFields?.first?.text
            let folder_Name = array_Folder(name_of_folder: name, name_of_notes: [])
        var flag = false
        for h in array_Folder.Folder_array {
            let any_name = folder_Name.name_of_folder
            if name == h.name_of_folder {
                flag = true
                break
            }
        }

       if flag {
                let alertcontrolleragain = UIAlertController (title: "Name Taken", message: "Choose a Different File", preferredStyle: .alert)
                let okAction2 = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertcontrolleragain.addAction(okAction2)
                self.present(alertcontrolleragain , animated: true , completion: nil)
                
        } else {
        array_Folder.Folder_array.append(folder_Name)
            
        }

            self.tableViewData.reloadData()

        }
                     AddItemAction.setValue(UIColor.black , forKey : "titleTextColor")
                      alertcontroller.addAction(okAction)
               alertcontroller.addAction(AddItemAction); self.present(alertcontroller, animated: true, completion: nil)
           
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
               
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array_Folder.Folder_array.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...

//           guard array_folder != nil else { return UITableViewCell() }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "id"){
            let folderNameCell = array_Folder.Folder_array[indexPath.row].name_of_folder
               cell.textLabel?.text = folderNameCell
        cell.imageView?.image = UIImage(named: "folder-icon")
            cell.detailTextLabel?.text = "\(array_Folder.Folder_array[indexPath.row].name_of_notes.count)"
            cell.detailTextLabel?.textColor = .white
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
            array_Folder.Folder_array.remove(at: indexPath.row)
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
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.lightGray
    }
//
//
//    // Override to support rearranging the table view.
//func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//
      func reload(){
    tableView.reloadData()
}
//
//    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
       return true
   }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let item = array_folder?[sourceIndexPath.row]
////        guard let item = array_folder?[sourceIndexPath.row] else { return array_folder }
//        array_folder?.remove(at: sourceIndexPath.row)
//        array_folder?.insert(item!, at: destinationIndexPath.row)
    }

    
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let Cell = tableView.cellForRow(at: indexPath)
//        let checkCell = array_folder![indexPath.row]
//        Cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
//
//    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        <#code#>
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let my_view = segue.destination as? FoldersPageTableViewController {
            my_view.foldersdelegate = self
            if let cell = sender as? UITableViewCell {
                if let my_index = tableView.indexPath(for: cell)?.row {
                    cur_index = my_index
                }
            }
        }
//        if let detailView = segue.destination as? showNotesViewController {
//                   if let tableViewcell = sender as? UITableViewCell {
//                       detailView.array_folder = self
//                       if let Index = tableView.indexPath(for: tableViewcell)?.row {
//                           detailView.textString = tasks![Index]
//                           curIndex = Index
//                       }
//                   }
//               }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}


