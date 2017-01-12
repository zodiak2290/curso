//
//  TodoList.swift
//  platzidos
//
//  Created by Desarrollo Uxi on 11/01/17.
//  Copyright © 2017 Alberto. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    var items : [String] = []
    
    func addItem(item: String)  {
        items.append(item)
    }
}

extension TodoList : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        return cell
    }
}
