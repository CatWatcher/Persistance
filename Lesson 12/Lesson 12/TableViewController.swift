//
//  TableViewController.swift
//  Lesson 12
//
//  Created by Феликс Фимберг on 09.01.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var weathers: [Weather] = []
    var dates: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "5 days weather"
        
        WeatherLoader().loadWeatherForFiveDays { (weathers, dates) in
            self.weathers = weathers
            self.dates = dates
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.set(object: weathers[indexPath.row], data: dates[indexPath.row])
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
    }
}
