//
//  AddVC.swift
//  Poc2
//
//  Created by Lucas Claro on 09/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import UIKit
import CoreData

class AddVC: ViewController {
    
    @IBOutlet weak var txtNome: UITextField!
    
    @IBAction func save(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(txtNome.text, forKey: "nome")
        
        do{
            try context.save()
            print("Salvo")
        }
        catch{
            print("Falha ao salvar")
        }
    }
}
