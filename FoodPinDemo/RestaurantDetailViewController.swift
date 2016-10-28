//
//  RestaurantDetailViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 28/10/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    var restaurantName: String = ""
    var restaurantType: String = ""
    var restaurantLocation: String = ""
    var restaurantImage: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = restaurantName
        typeLabel.text = restaurantType
        locationLabel.text = restaurantLocation
        restaurantImageView.image = UIImage(named: restaurantImage)
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
