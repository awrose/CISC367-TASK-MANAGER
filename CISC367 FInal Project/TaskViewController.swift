//
//  TaskViewController.swift
//  CISC367 FInal Project
//
//  Created by Abigail Walters on 5/12/22.
//

import UIKit

class TaskViewController: ToDo {
    
    @IBOutlet var label: UILabel!
    
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task

        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
        //let newCount = count -1
        
        //UserDefaults().setValue(newCount, forKey: "count")
        //UserDefualts().setValue(nil, forKey: "task_\(currentPosition)")
    }
    

}
