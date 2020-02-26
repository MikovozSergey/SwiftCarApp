//
//  MainViewController.swift
//  CarsApp
//
//  Created by Дарья Станкевич on 2/24/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var cars = Car.getCars()
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let car = cars[indexPath.row]
        
        cell.markLabel.text = car.mark
        cell.locationLabel.text = car.location
        cell.descriptionLabel.text = car.description
        
        if car.image == nil {
            cell.imageOfCars.image = UIImage(named: car.carImage!) // присваиваем значение картинки при добавлении нового автомобиля
        } else {
            cell.imageOfCars.image = car.image
        }
        
        cell.imageOfCars.layer.cornerRadius = cell.imageOfCars.frame.size.height / 2
        cell.imageOfCars.clipsToBounds = true
        
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
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) { // кнопка save возвращающая и добавляющая значения
        
        guard let newCarVC = segue.source as? NewCarViewController else { return }
        
        newCarVC.saveNewCar()
        cars.append(newCarVC.newCar!)// nil не получим т.к. не нажмем кнопку save если поле пустое
        tableView.reloadData()
    }

}
