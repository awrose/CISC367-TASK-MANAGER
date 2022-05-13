//
//  OnGoingToDo.swift
//  CISC367 FInal Project
//
//  Created by Abigail Walters on 5/12/22.
//

import UIKit

class ToDo: UIViewController{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [String]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        
        //tableView.delegate = self
        //tableView.dataSource = self
        
        //set up
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        updateTasks()
        
        //get all current saved tasks
    }
    
    func updateTasks(){
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count{
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String{
                tasks.append(task)
            }
        }
        
        //tableView.reloadData()
        
    }
    
    @IBAction func didTappAdd(){
        
        //show another view controller
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! Entry_View_Controller
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension ToDo: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "task name"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //deque a cell: reusing template over and over to get the instance, but provide the data for it
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
