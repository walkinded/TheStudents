//
//  StudentTableViewCell.swift
//  TheStudents
//
//  Created by Роман Лабунский on 13/12/2019.
//  Copyright © 2019 Роман Лабунский. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWith(_ student: Student) {
           self.name.text = student.name
           self.lastname.text = student.lastname
           if student.photo != nil{
               self.img.image = UIImage(named: student.photo!)
           }
       }

}
