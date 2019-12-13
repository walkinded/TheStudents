//
//  DataManagerSingltone.swift
//  TheStudents
//
//  Created by Роман Лабунский on 13/12/2019.
//  Copyright © 2019 Роман Лабунский. All rights reserved.
//

import Foundation


class DataManager {
    
    // MARK --
    // MARK: Arry of Students
    var lastname = [
        "Опранов", "Олмин", "Полин", "Литерин", "Гирин", "Килента", "Гартер", "Кумарин", "Линтест", "Моськин"
    ]
    
    let lastnameGirl = "a"
    
    let age = [
        17, 18, 19, 20, 21
    ]
    
    let coins = [
           1, 2, 3, 4, 5
       ]
    
    let position = ["студент", "студентка"]
    
    //Info about student
    let womanPhoto = [
        "woman.png"
    ]
    let manPhoto = [
        "man.png"
    ]
    let genders = [
        "мужской", "женский"
    ]
    
    let nameBoy = [
        "Кирилл", "Роман", "Владимир", "Владислав", "Сергей", "Алим", "Ибраим", "Мустафа", "Александр", "Андрей"
    ]
    let nameGirl = [
        "Евгения", "Екатерина", "Виктория", "Надежда", "Анастасия", "Юлия", "Лилия", "Афифе", "Анна", "Александра"
    ]
    
    static let shared = DataManager()
    
    func getPhoto(gender: Gender) -> String{
        if gender.rawValue == "мужской" {
            return manPhoto[0]
        }else{
            return womanPhoto[0]
        }
    }
    
    func getNameBoy(index: Int) -> String {
        return self.nameBoy[index]
    }
    
    func getNameGirl(index: Int) -> String {
        return self.nameGirl[index]
    }
    
    //MARK: get info about a students
    func getLastnameStudent(index: Int) -> String {
        return lastname[index]
    }
    
    
    // MARK: TODO sort of lastname
    func getSortLastnameStudent() {
        lastname.sort()
    }
    
    func getYears(index: Int) -> Int {
        return self.age[Int.random(in: 0...4)]
    }
    
    func getCoins(index: Int) -> Int {
          return self.coins[Int.random(in: 0...4)]
    }
    
    func getGender() -> Gender {
        return Gender(rawValue: genders[Int.random(in: 0...1)])!
    }
    
    func getFioStudent(gender: Gender) -> (name: String?, lastname: String?, position: String?){
        if gender == .male{
            return (self.nameBoy[Int.random(in: 0...9)], self.lastname[Int.random(in: 0...4)], self.position[0])
        }else{
            return (self.nameGirl[Int.random(in: 0...9)], self.lastname[Int.random(in: 0...4)], self.position[1])
        }
    }
}
