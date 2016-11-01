//
//  WalkthroughContentViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 01/11/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit

class SinglePage: UIViewController {
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)
        
        pageCtrl.currentPage = index
    }

}
