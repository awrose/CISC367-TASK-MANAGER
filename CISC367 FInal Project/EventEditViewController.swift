//
//  EventEditViewController.swift
//  CISC367 FInal Project
//
//  Created by Abigail Walters on 5/9/22.
//

import UIKit

class EventEditViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        datePicker.date = selectedDate
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTf.text
        newEvent.date = datePicker.date
        eventsList.append(newEvent)
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
}
