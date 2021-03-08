//
//  TableViewController.swift
//  Lesson 10
//
//  Created by Феликс Фимберг on 23.10.2020.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderHeight = 10
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "   "
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section {
        case 0:
            return 5
        case 1:
            return 4
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let airplane = tableView.dequeueReusableCell(withIdentifier: "airplaneModeCell") as! AirplaneTableViewCell
        
        
        switch indexPath.row {
        case 0:
            if indexPath.section == 0 {
                return airplane
            } else if indexPath.section == 2 {
                cell.rightLabel.text = "1"
                cell.rightLabel.textColor = .red
                cell.rightLabel.alpha = 1
            }
            return cell
        case 1...2:
            if indexPath.section == 0 {
                cell.rightLabel.text = "text"
            } else {
                cell.rightLabel.text = ""
            }
            return cell
        default:
            
            cell.rightLabel.text = ""
            return cell
        }
    }
}
