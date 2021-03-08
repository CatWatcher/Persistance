//
//  AlamofireTableViewController.swift
//  Lesson 12
//
//  Created by Феликс Фимберг on 25.01.2021.
//

import UIKit

class AlamofireTableViewController: UITableViewController {
    
    var weathers: [Weather] = []
    var dates: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Alamofire 5 day weather"
        
        AlamofireWeatherLoader().loadWeatherForFiveDays { (weathers, dates) in
            self.weathers = weathers
            self.dates = dates
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alamofireCell", for: indexPath) as! TableViewCell
        
        cell.set2(object: weathers[indexPath.row], data: dates[indexPath.row])
        
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weathers.count
    }
}
