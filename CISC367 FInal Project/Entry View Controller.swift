//
//  Entry View Controller.swift
//  CISC367 FInal Project
//
//  Created by Abigail Walters on 5/12/22.
//

import UIKit

class Entry_View_Controller: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    var update: (() -> Void)?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        return true
    }
    
    @objc func saveTask(){
        //save our contents of fields
        
        //make sure field isn't empty
        guard let text = field.text, !text.isEmpty else{
            return
        }
        
        //save our task
        //use user default - lightweight mechanism built in
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
    
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
}
