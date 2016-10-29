//
//  RestaurantDetailViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 28/10/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //@IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var locationLabel: UILabel!
    //@IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    var restaurant: Restaurant!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //nameLabel.text = restaurant.name
        //typeLabel.text = restaurant.type
        //locationLabel.text = restaurant.location
        restaurantImageView.image = UIImage(named: restaurant.image)
        
        // set table view bg color
        tableView.backgroundColor = UIColor(white: 240.0/255, alpha: 0.2)
        // remove empty rows
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //set separator color
        tableView.separatorColor = UIColor(white: 240.0/255, alpha: 0.8)
        
        title = restaurant.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = restaurant.isVisited ? "Yes, I've been here" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
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
