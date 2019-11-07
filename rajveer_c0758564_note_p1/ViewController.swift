////
////  ViewController.swift
////  rajveer_c0758564_note_p1
////
////  Created by Rajveer Kaur on 2019-11-07.
////  Copyright © 2019 Rajveer Kaur. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    var arrayfolders : [String]?
//    var imageView : UIImage?
//
//    @IBAction func folderButton(_ sender: UIButton) {
//        let alertcontroller = UIAlertController(title: "New Folder", message: "Enter a name for this folder.", preferredStyle: .alert)
//        alertcontroller.addTextField {
//            (textField) in textField.text = ""
//        }
//        
//               let okAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        let AddItemAction = UIAlertAction(title:"Add Item" , style: .default)
//               
//               alertcontroller.addAction(okAction)
//        alertcontroller.addAction(AddItemAction); self.present(alertcontroller, animated: true, completion: nil)
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//       self.navigationItem.rightBarButtonItem = editButtonItem
//          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//               guard arrayfolders != nil else { return UITableViewCell() }
//                let cell = UITableViewCell(style: .default, reuseIdentifier: "")
//               let folderName = arrayfolders![indexPath.row]
//               cell.textLabel?.text = folderName
//             cell.imageView?.image = UIImage(named: folderName)
//              return cell
////                guard arrayfolders != nil && unHealthyFoods != nil else {return UITableViewCell()}
////                let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
////                let folderName = (indexPath.section == 0) ? healthyFoods![indexPath.row] : unHealthyFoods![indexPath.row]
//                cell.textLabel?.text = folderName
//                cell.imageView?.image = UIImage(named: folderName)
//                cell.detailTextLabel?.text = "Row \(indexPath.row)"
//                return cell
//            }
//            
//    }
//
//
//}
//
//
