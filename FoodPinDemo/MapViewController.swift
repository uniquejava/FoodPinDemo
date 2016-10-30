//
//  MapViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 30/10/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("湖北省鄂州高中", completionHandler: {
            placemarks, error in
            if error != nil {
                print(error!)
                return
            }
            
            if let coordinate = placemarks?[0].location?.coordinate {
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = "湖北省鄂州高中"
                annotation.subtitle = "滨湖南路特一号"
                //self.mapView.addAnnotation(annotation)
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
                // set the zoom level, 250 meters
                //let region = MKCoordinateRegionMakeWithDistance(coordinate, 250, 250)
                //self.mapView.setRegion(region, animated: true)
            }
            
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
