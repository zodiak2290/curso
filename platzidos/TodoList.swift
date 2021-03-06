//
//  TodoList.swift
//  platzidos
//
//  Created by Desarrollo Uxi on 11/01/17.
//  Copyright © 2017 Alberto. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    //var items : [String] = []
    var items : [TodoItem] = []
    override init(){
        super.init()
        loadItems()
    }
    
    private let fileURL: URL = {
        let fileManager = FileManager.default
        let documentDirectoryURLs = fileManager.urls(for: .documentDirectory, in: .userDomainMask) as [NSURL]
        
        let documentDirectryURL = documentDirectoryURLs.first!
        print("\(documentDirectryURL)")
        //return documentDirectryURL.appendingPathComponent("todolist.items")!
        return documentDirectryURL.appendingPathComponent("todolist.plist")!
    }()
    
    //func addItem(item: String)  {
    func addItem(item: TodoItem){
        items.append(item)
        saveItems()
    }
    
    func saveItems() {
        let itemsArray = items  as NSArray
        if NSKeyedArchiver.archiveRootObject(itemsArray, toFile: self.fileURL.path){
            print("Guardado")
        }else{
            print("No guardado")
        }
        /*if itemsArray.write(to: self.fileURL as URL, atomically: true){
            print("Guardado")
        }else{
            print("No guardado")
        }*/
    }
    
    func loadItems()  {
        //if let itemsArray = NSArray(contentsOf: self.fileURL) as? [String]{
        if let itemsArray = NSKeyedUnarchiver.unarchiveObject(withFile: self.fileURL.path){
            //self.items = itemsArray
            self.items = itemsArray as! [TodoItem]
        }
    }
    
}

extension TodoList : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        //cell.textLabel!.text = item
        cell.textLabel!.text = item.todo
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        saveItems()
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
    //func getItem(index: Int) -> String {
    func getItem(index:Int) -> TodoItem{
        return items[index]
    }
}
