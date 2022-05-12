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
        
        //datePicker.date = selectedDate
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTf.text
        newEvent.start = startDatePicker.date
        newEvent.end = endDatePicker.date
        //newEvent.importImg = UIImage(imageView.image)
        //newEvent.allDay = allDaySwitch.self
        //newEvent.date = datePicker.date
        newEvent.descr = descriptionTf.text
        eventsList.append(newEvent)
        navigationController?.popViewController(animated: true)
    }
        
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var descriptionTf: UITextField!
    //@IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var allDaySwitch: UISwitch!
    @IBAction func didTapButton(_ sender: Any) {
        let vc = UIImagePickerController()
        var videoURL: NSURL?
        
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.mediaTypes = ["public.image", "public.movie"]
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
}

extension EventEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let movieUrl = info[.mediaURL] as? URL else {return }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
}
