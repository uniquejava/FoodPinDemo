//
//  AddRestaurantController.swift
//  FoodPinDemo
//
//  Created by cyper on 31/10/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var isVisited = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                imagePicker.delegate = self
                
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        // Add 4 constraints
        let superview = photoImageView.superview
        
        let leading = NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: 0)
        leading.isActive = true
        
        let trailing = NSLayoutConstraint(item: photoImageView, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailing.isActive = true
        
        let top = NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: 0)
        top.isActive = true
        
        let bottom = NSLayoutConstraint(item: photoImageView, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottom.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didClickYesNoButton(_ sender: UIButton) {
        if sender == yesButton {
            yesButton.backgroundColor = UIColor.red
            noButton.backgroundColor = UIColor.lightGray
            isVisited = true
        } else {
            noButton.backgroundColor = UIColor.red
            yesButton.backgroundColor = UIColor.lightGray
            isVisited = false
        }
        
    }

    
    @IBAction func saveRestaurant() {
        if checkForm() {
            //dismiss(animated: true, completion: nil)
            
            // see here: http://stackoverflow.com/questions/27889645/performseguewithidentifier-has-no-segue-with-identifier
            performSegue(withIdentifier: "unwindToHomeScreen", sender: self)
            
        } else {
            let controller = UIAlertController(title: "Oops", message: "We can't proceed, all fields are mandatory!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
        }
    }
    
    func checkForm() -> Bool {
        guard let name = nameTextField.text, !name.isEmpty else {
            return false
        }
        guard let type = typeTextField.text, !type.isEmpty else {
            return false
        }
        
        guard let location = locationTextField.text, !location.isEmpty else {
            return false
        }
        
        
        print(name)
        print(type)
        print(location)
        print(isVisited)
        
        
        return true
    }
    
    

}
