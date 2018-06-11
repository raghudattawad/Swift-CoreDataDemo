//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Raghavendra Dattawad on 15/11/17.
//  Copyright © 2017 Raghavendra Dattawad. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {


    @IBOutlet weak var userNameFiled: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
       
     self.method()
        

        let myname =
        self.method1(name: "einstein")
    
        print(myname)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func Save(_ sender: Any) {
       
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let  context = appDelegate.persistentContainer.viewContext;
        
    
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
     
        
        newUser.setValue(self.userNameFiled.text, forKey: "userNme")
        newUser.setValue(self.passwordField.text, forKey: "pwd")
        
        
        
        do{
            try context.save()
        }
        catch{
            
            print("Failed to save")
            
            
        }
    
    }
    

    @IBAction func Load(_ sender: Any) {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let  context = appDelegate.persistentContainer.viewContext;

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "userNme") as! String)
            }

        } catch {

            print("Failed")
        }



    }
    
    
    func method(){
        
       print("inside method")
    }
        
    func method1(name:String) -> String {
        
        return name + "ns"
    }
        
        
        
    
}

