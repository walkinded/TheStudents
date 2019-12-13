//
//  ViewController.swift
//  TheStudents
//
//  Created by Роман Лабунский on 13/12/2019.
//  Copyright © 2019 Роман Лабунский. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    private var students = [Student]()
    private var searchStudent = [Student]()
    
    let manager = DataManager.shared
    
    private let searchController  = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
       
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Search Conroller
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //student
        for index in 0...9 {
            let student = Student.init(index: index)
            self.students.append(student)
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if section == 0{
            if isFiltering {
                return searchStudent.count
            }else{
                return students.count
            }
        }
      return section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
        cell.selectionStyle = .none
             
         var searchS: Student
         
         if indexPath.section == 0{
            if isFiltering {
                searchS = searchStudent[indexPath.row]
            }else{
                searchS = students[indexPath.row]
            }
            cell.setupWith(searchS)
         }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailOfStudentViewController") as! DetailOfStudentViewController
        if indexPath.section == 0{
            if let student = self.students[indexPath.row] as? Student {
                vc.student = student
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        searchStudent = students.filter({ (students: Student) -> Bool in
            return (students.name!.lowercased().range(of: searchText.lowercased()) != nil)
        })
        
        TableView.reloadData()
    }
}
