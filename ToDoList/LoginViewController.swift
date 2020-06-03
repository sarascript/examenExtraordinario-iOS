//
//  LoginViewController.swift
//  ToDoList
//
//  Created by Sara Correas on 03/06/2020.
//  Copyright © 2020 kodechamp. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        let predicates = NSPredicate(format: "%K == %@ AND %K == %@", argumentArray: ["user", txtUser.text!, "password", txtPassword.text!])
        request.predicate = predicates
        
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            if result.count == 1 {
                performSegue(withIdentifier: "segueTableView", sender: self)
            } else {
                let alert = UIAlertController(title: "Error", message: "Incorrect user or password", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        } catch {
            let alert = UIAlertController(title: "Error", message: "Incorrect user or password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
