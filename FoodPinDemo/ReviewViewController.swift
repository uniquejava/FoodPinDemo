//
//  ReviewViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 30/10/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ratingImageView.image = UIImage(named: restaurant.image)
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let scaleTransform = CGAffineTransform(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        closeButton.transform = CGAffineTransform(translationX: 100, y: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //UIView.animate(withDuration: 0.3, animations: {
        //    self.containerView.transform = CGAffineTransform.identity
        //})
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
            self.containerView.transform = CGAffineTransform.identity
        }, completion: nil)
        
        // close button animation
        UIView.animate(withDuration: 0.5, animations: {
            self.closeButton.transform = CGAffineTransform.identity
        })
        
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
