//
//  СarModel.swift
//  CarsApp
//
//  Created by Дарья Станкевич on 2/25/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

struct Car {
    var mark: String
    var location: String?
    var description: String?
    var image: UIImage?
    var carImage: String?
    
    static let carNames = ["Audi", "Mercedes-Benz", "BMW", "Volkswagen"]
    
    static func getCars () -> [Car] {
        
        var cars = [Car]()
        
        for car in carNames {
            cars.append(Car(mark: car, location: "Minsk", description: "A car", image: nil, carImage: car ))
        }
        
        return cars
    }
    
}
