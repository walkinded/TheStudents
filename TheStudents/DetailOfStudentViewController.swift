//
//  DetailOfStudentViewController.swift
//  TheStudents
//
//  Created by Роман Лабунский on 13/12/2019.
//  Copyright © 2019 Роман Лабунский. All rights reserved.
//

import UIKit

class DetailOfStudentViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var mail: UIButton!
    @IBOutlet weak var conis: UILabel!

    var image = UIImage()
    
    let rand = Int.random(in: 0...1)

    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.student != nil{
            self.newWindow(student!)
        }
    }
    
    func newWindow(_ student: Student) {
        self.name.text = student.name
        self.lastname.text = student.lastname
        self.gender.text = student.gender.rawValue
        self.position.text = student.position
        self.age.text = "\(student.years ?? 0)"
        self.conis.text = "Оценка: \(student.coins ?? 0)"
        if student.photo != nil{
            self.img.image = UIImage(named: student.photo!)
        }
    }
    
    @IBAction func actounTap(_ sender: Any) {
        
        if rand == 0 {
          let alert = UIAlertController(title: "Sorry", message: "No link to address.", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
          NSLog("The \"OK\" alert occured.")
          }))
          self.present(alert, animated: true, completion: nil)
        }
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
