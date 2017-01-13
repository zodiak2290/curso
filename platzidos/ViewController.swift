//
//  ViewController.swift
//  platzidos
//
//  Created by Desarrollo Uxi on 29/12/16.
//  Copyright © 2016 Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let todoList = TodoList()
    
    static let MAX_TEXT_SIZE = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    @IBAction func addButtonPressed(_ sender: Any) {
        print("hi")
        todoList.addItem(item: itemTextField.text!)
        tableView.reloadData()
        self.itemTextField.text = ""
        self.itemTextField?.resignFirstResponder()
    }
    
    //MARK: Metodos del table view delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.itemTextField?.resignFirstResponder()
    }
    
    //MARK: metodos del text field delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //let currentLengt = textField.text?.characters.count
        if let tareaString = textField.text as? NSString{
            let updateString = tareaString.replacingCharacters(in: range, with: string)
            return updateString.characters.count < 31
        }else{
            return true
        }
            
    }
}
