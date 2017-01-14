//
//  DetailViewController.swift
//  platzidos
//
//  Created by Desarrollo Uxi on 12/01/17.
//  Copyright © 2017 Alberto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var item: String?
    var seletedDate :Date?
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel.text = item
        //print(item)
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer()
        
        tapGestureRecognizer.numberOfTapsRequired = 1
        //tapGestureRecognizer.numberOfTouches = 1
        
        tapGestureRecognizer.addTarget(self, action: #selector(DetailViewController.toggleDatePicker))
        self.dateLabel.addGestureRecognizer(tapGestureRecognizer)
        self.dateLabel.isUserInteractionEnabled = true
    }
    
    func toggleDatePicker()  {
        self.imageView.isHidden = !self.imageView.isHidden
        datePicker.isHidden = !datePicker.isHidden
    }
    
    @IBAction func dateSelected(_ sender: UIDatePicker) {
        self.seletedDate = sender.date
        toggleDatePicker()
        //print("Selected date: \(selectedDate)")
        self.dateLabel.text = formatDate(date: sender.date )
        //let delegate = UIApplication.shared.delegate as? AppDelegate
        //delegate?.scheduleNotification(at: selectedDate)
        
    }
    
    @IBAction func addNotification(_ sender: UIBarButtonItem) {
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

    @IBAction func addImage(_ sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        //imagePickerController.sourceType = UIImagePickerControllerSourceType.camera
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //self.presentedViewController(imagePickerController, animated: true, completion: nil)
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }

    //MARK: Image Picker Controller Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.imageView.image = image
        }
        toggleDatePicker()
        self.dismiss(animated: true, completion: nil)
    }
}














