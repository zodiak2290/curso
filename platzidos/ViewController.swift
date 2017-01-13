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
    var selectedItem: String?
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedItem = self.todoList.getItem(index: indexPath.row)
        self.performSegue(withIdentifier: "showItem", sender: self)
        /* lo mismo que el codigo de arriba
        let detailVC = DetailViewController()
        detailVC.item = self.selectedItem
        self.navigationController?.pushViewController(detailVC, animated: true)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController{
            detailViewController.item = self.selectedItem
        }
    }
    //MARK: metodos del text field delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //let currentLengt = textField.text?.characters.count
        if let tareaString = textField.text as? NSString{
            let updateString = tareaString.replacingCharacters(in: range, with: string)
            return updateString.characters.count < ViewController.MAX_TEXT_SIZE
        }else{
            return true
        }
            
    }
}
