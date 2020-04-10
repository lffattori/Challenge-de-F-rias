//
//  TableViewControllerHistorico.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 19/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class RecordsController: UITableViewController{
    var reflexionRecords:[Reflexoes] = []
    var context:NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        getData()
        print(reflexionRecords.count)
    }
    
    func getData(){
        do {
            guard let context = context else {return}
            reflexionRecords = try context.fetch(Reflexoes.fetchRequest())
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Card") as! ReflexionCell
        cell.cost.text = "R$ " + String(reflexionRecords[indexPath.row].valor).replacingOccurrences(of: ".", with: ",")
        cell.reflexion.text = reflexionRecords[indexPath.row].reflexao
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reflexionRecords.count
    }
    
}
