//
//  FoldersPageTableViewController.swift
//  rajveer_c0758564_note_p1
//
//  Created by Rajveer Kaur on 2019-11-11.
//  Copyright © 2019 Rajveer Kaur. All rights reserved.
//

import UIKit

class FoldersPageTableViewController: UITableViewController {
    var foldersdelegate : NewFolderTableViewController?
    var cur_Index = -1
    var array : [String]?
     var selectedrows : [IndexPath]?
    var num_rows : [IndexPath]?
    @IBOutlet weak var delete_bar_button: UIBarButtonItem!
    
    @IBOutlet weak var move_bar_button: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    // MARK: - Table view data source
//array = []
        delete_bar_button.isEnabled = false
        move_bar_button.isEnabled = false
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array_Folder.Folder_array[(foldersdelegate?.cur_index)!].name_of_notes.count
        // #warning Incomplete implementation, return the number of rows
       
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      

        if  let cell = tableView.dequeueReusableCell(withIdentifier: "mynote") {
            if let label = cell.viewWithTag(1) as?
                UILabel {
                label.text = array_Folder.Folder_array[(foldersdelegate?.cur_index)!].name_of_notes[indexPath.row]
            }
            
            
        cell.backgroundColor = .lightGray
        let arrayname = array_Folder.Folder_array[(foldersdelegate?.cur_index)!].name_of_notes[indexPath.row]
        cell.textLabel?.text = arrayname
        cell.accessoryType = .detailButton

        return cell
    
    }
    return UITableViewCell()
}
    
    @IBAction func deletebtn(_ sender: Any) {
       let AlertController = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: .alert)
        let okAction2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               okAction2.setValue(UIColor.brown, forKey: "titleTextColor")
        let deleteitemaction = UIAlertAction(title: "Delete", style: .default)
        { (action) in
            if let rows_Selected = self.tableView.indexPathsForSelectedRows {
                var item = [String]()
                for index_path in rows_Selected {
                    item.append(array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes[index_path.row])
                        
                    }
                
                
                for i in item {
                    if let random_item = array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes.index(of: i){
                        array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes.remove(at: random_item)
                    }
                }
                self.tableView.deleteRows(at: rows_Selected, with: .automatic)
                self.tableView.reloadData()
            }
          
        }
//       AlertController.setValue(UIColor.black , forKey : "titleTextColor")
        deleteitemaction.setValue(UIColor.black, forKey: "titleTextColor")
                   AlertController.addAction(okAction2)
       AlertController.addAction(deleteitemaction); self.present(AlertController, animated: true, completion: nil)
        
    

    
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
          tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
    }
    
    
    @IBAction func ellispe_button(_ sender: UIBarButtonItem) {
        if delete_bar_button.isEnabled == false && move_bar_button.isEnabled == false {
            delete_bar_button.isEnabled = true
            move_bar_button.isEnabled = true
        } else if delete_bar_button.isEnabled == true && move_bar_button.isEnabled == true {
            delete_bar_button.isEnabled = false
            move_bar_button.isEnabled = false
        }
    }
   func moveItem(atPath srcPath:String,
                          toPath dstPath:String ) throws {
    
    }

    //            override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    tableView.deselectRow(at: indexPath, animated: true)
//          let Cell = tableView.cellForRow(at: indexPath)
//           let checkCell = array![indexPath.row]
////       if checkCell.count == 0 {
////                if self.array!.contains() {
////        Cell?.accessoryType = UITableViewCell.AccessoryType.detailDisclosureButton
////       } else {
////          Cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
//      }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
   func notes_moved(index : Int){
   selectedrows = tableView.indexPathsForSelectedRows!
   
   for i in selectedrows!{
       
       let move = array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes[i.row]
      array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes.append(move)
   }
   
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailView = segue.destination as? showNotesViewController {
            detailView.taskTable = self
            
            
            
            if let tableViewcell = sender as? UITableViewCell {
                if let index = tableView.indexPath(for: tableViewcell)?.row {
                    detailView.textString = array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes[index]
                    cur_Index = index
                }
            }
        }
        
    }
func updateText (text :String){
   if cur_Index != -1 && array != nil {

array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes [cur_Index] = text
    let indexPath = IndexPath(item: cur_Index , section : 0)
    tableView.reloadRows(at: [indexPath], with: .none)
    cur_Index = -1
    
        
    }
        else if array != nil && cur_Index == -1 {
           array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes.append(text)
    
    
   
            tableView.reloadData()
     foldersdelegate?.reload()
    return
        }
    }
    
    
    
    
    
    
    
    func delete_rows() {
        
        selectedrows = tableView.indexPathsForSelectedRows!
        var new = [String]()
        for indexpath in selectedrows!{
            new.append(array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes[indexpath.row])
            
        }
        for n in new{
            if let index = array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes.firstIndex(of: n)
            {
                array_Folder.Folder_array[(self.foldersdelegate?.cur_index)!].name_of_notes.remove(at: index)
            }
        }
        tableView.reloadData()
        foldersdelegate?.tableView.reloadData()
    }

}


