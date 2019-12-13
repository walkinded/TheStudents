//
//  WebAddressViewController.swift
//  TheStudents
//
//  Created by Роман Лабунский on 13/12/2019.
//  Copyright © 2019 Роман Лабунский. All rights reserved.
//

import UIKit

class WebAddressViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = URL(string: "https://github.com/walkinded")
        let urlRequest = URLRequest(url: url!)
        
        webView.loadRequest(urlRequest)

        // Do any additional setup after loading the view.
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
