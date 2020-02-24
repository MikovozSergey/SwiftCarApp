//
//  MainViewController.swift
//  CarsApp
//
//  Created by Дарья Станкевич on 2/24/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    let carNames = ["Audi", "Mercedes-Benz", "BMW", "Volkswagen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = carNames[indexPath.row]
        cell.imageView?.image = UIImage(named: carNames[indexPath.row])
        
        return cell
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
