//
//  StudentsClass.swift
//  TheStudents
//
//  Created by Роман Лабунский on 13/12/2019.
//  Copyright © 2019 Роман Лабунский. All rights reserved.
//

import Foundation
import UIKit

class Student {
    
    let manager = DataManager.shared
    
    var name: String?
    var lastname: String?
    var years: Int?
    var gender: Gender!
    var photo: String?
    var position: String?
    var coins: Int?
    
    
    init(index: Int) {
        self.gender = manager.getGender()
        let tmpName = manager.getFioStudent(gender: gender)
        self.name = tmpName.name
        self.lastname = tmpName.lastname
        self.position = tmpName.position
        self.years = manager.getYears(index: index)
        self.photo = manager.getPhoto(gender: gender)
        self.coins = manager.getCoins(index: index)
    }
}
