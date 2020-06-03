//
//  RegisterViewController.swift
//  ToDoList
//
//  Created by Sara Correas on 03/06/2020.
//  Copyright © 2020 kodechamp. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func register() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        entity.setValue(txtUser.text, forKey: "user")
        entity.setValue(txtPassword.text, forKey: "password")
        
        do {
            try context.save()
            dismiss(animated: true, completion: nil)
        } catch {
            let alert = UIAlertController(title: "Error", message: "Something gone wrong", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func goBackToLogin() {
        dismiss(animated: true, completion: nil)
    }

}
