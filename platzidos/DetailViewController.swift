//
//  DetailViewController.swift
//  platzidos
//
//  Created by Desarrollo Uxi on 12/01/17.
//  Copyright © 2017 Alberto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var item: String?
    var seletedDate :Date?
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel.text = item
        //print(item)
        // Do any additional setup after loading the view.
    }

    @IBAction func dateSelected(_ sender: UIDatePicker) {
        self.seletedDate = sender.date
        
        //print("Selected date: \(selectedDate)")
        self.dateLabel.text = formatDate(date: sender.date )
        //let delegate = UIApplication.shared.delegate as? AppDelegate
        //delegate?.scheduleNotification(at: selectedDate)
        
    }
    
    @IBAction func addNotification(_ sender: UIBarButtonItem) {
        print("Agregar")
        if let dateString = self.dateLabel.text {
            print(dateString)
        
            let delegate = UIApplication.shared.delegate as? AppDelegate
            delegate?.scheduleNotification(at: self.seletedDate!, message: self.item!)
        }else{
            print("Fecha no valida")
        }
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter.string(from: date )
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}














