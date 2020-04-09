//
//  getVC.swift
//  Poc2
//
//  Created by Lucas Claro on 09/04/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class getVC: UITableViewController{
    var dataSource = [String]()
    
    override func viewDidLoad() {
        getData()
        super.viewDidLoad()
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        
        request.returnsObjectsAsFaults = false
        
        do{
            let resultado = try context.fetch(request)
            for data in resultado as! [NSManagedObject] {
                let nome = data.value(forKey: "nome") as! String
                dataSource.append(nome)
            }
        }
        catch{
            print("Erro de leitura")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! getCell
        
        customCell.lblNome.text = dataSource[indexPath.row]
        
        return customCell
    }
    
    /*override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            
        }
    }*/
}
