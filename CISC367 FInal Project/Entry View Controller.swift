//
//  Entry View Controller.swift
//  CISC367 FInal Project
//
//  Created by Abigail Walters on 5/12/22.
//

import UIKit

class Entry_View_Controller: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    @IBOutlet weak var descrTf: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
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
        let newTask = Ongoing()
        newTask.title = field.text
        newTask.descr = descrTf.text
        //newTask.importImg = UIImage(imageView.image)
        newTask.id = ongoingList.count
        //save our contents of fields
        ongoingList.append(newTask)
        
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
    @IBAction func didTapUpload(_ sender: Any) {
        let vc = UIImagePickerController()
        
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.mediaTypes=["public.image", "public.move"]
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    @IBAction func didTapTake(_ sender: Any) {
        let picker=UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}

extension Entry_View_Controller: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
        
        //guard let movieUrl = info[.mediaURL] as? URL else {return }
        
        guard let takenImg = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        imageView.image = takenImg
        
}
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}
