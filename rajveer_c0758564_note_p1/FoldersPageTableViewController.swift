//
//  FoldersPageTableViewController.swift
//  rajveer_c0758564_note_p1
//
//  Created by Rajveer Kaur on 2019-11-11.
//  Copyright © 2019 Rajveer Kaur. All rights reserved.
//

import UIKit

class FoldersPageTableViewController: UITableViewController {
var array : [String]?
    var cur_Index = -1
    
    
    @IBOutlet weak var delete_bar_button: UIBarButtonItem!
    
    @IBOutlet weak var move_bar_button: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    // MARK: - Table view data source
array = []
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array?.count ?? 0
        // #warning Incomplete implementation, return the number of rows
       
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let item = array?[indexPath.row]
       {

        if  let cell = tableView.dequeueReusableCell(withIdentifier: "mynote") {
            if let label = cell.viewWithTag(1) as?
                UILabel {
                label.text = item
            }
            
            
        cell.backgroundColor = .lightGray
        let arrayname = array![indexPath.row]
        cell.textLabel?.text = arrayname
        cell.accessoryType = .detailButton

        return cell
    }
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
                    item.append(self.array![index_path.row])
                }
                for k in item {
                    if let random_item = self.array!.firstIndex(of: k) {
                        self.array!.remove(at: random_item)
                    }
                }
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: rows_Selected, with: .automatic)
                self.tableView.endUpdates()
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
   
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailView = segue.destination as? showNotesViewController {
            detailView.taskTable = self
            
            
            
            if let tableViewcell = sender as? UITableViewCell {
                if let index = tableView.indexPath(for: tableViewcell)?.row {
                    detailView.textString = array![index]
                    cur_Index = index
                }
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
func updateText (text :String){
   if cur_Index != -1 && array != nil {

array! [cur_Index] = text
    let indexPath = IndexPath(item: cur_Index , section : 0)
    tableView.reloadRows(at: [indexPath], with: .none)
    cur_Index = -1
    
        
    }
        else if array != nil && cur_Index == -1 {
            array?.append(text)
            tableView.reloadData()
        }

}

}
