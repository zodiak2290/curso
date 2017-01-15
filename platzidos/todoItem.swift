//
//  todoItem.swift
//  platzidos
//
//  Created by Desarrollo Uxi on 14/01/17.
//  Copyright © 2017 Alberto. All rights reserved.
//

import UIKit

class TodoItem: NSObject, NSCoding {
    
    var todo : String?
    var dueDate: Date?
    var image: UIImage?
    
    override init(){
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        if let message = aDecoder.decodeObject(forKey: "todo") as? String {
            self.todo = message
        }
        
        if let date = aDecoder.decodeObject(forKey: "dueDate") as? Date {
            self.dueDate = date
        }
        
        if let img = aDecoder.decodeObject(forKey: "image") as? UIImage {
            self.image = img
        }
    }
    
    func encode(with aCoder: NSCoder) {
        if let message = self.todo{
            aCoder.encode(message, forKey: "todo")
        }
        
        if let date = self.dueDate{
            aCoder.encode(date, forKey: "dueDate")
        }
        
        if let img = self.image{
            aCoder.encode(img, forKey: "image")
        }
        
    }
}
