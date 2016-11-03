//
//  DiscoverTableViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 03/11/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit
import CloudKit

class DiscoverTableViewController: UITableViewController {
    var restaurants: [CKRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRecordsFromCloud()
    }

    func fetchRecordsFromCloud() {
        // Fetch data using Convenience API
        let cloudContainer = CKContainer.default()
        let publicDb = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        
        publicDb.perform(query, inZoneWith: nil, completionHandler: {
            (results, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            if let results = results {
                print("completed the download of res data")
                self.restaurants = results
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        })
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let r = restaurants[indexPath.row]
        cell.textLabel?.text = r.object(forKey: "name") as? String
        
        if let image = r.object(forKey: "image") {
            let imageAsset = image as! CKAsset
            if let imageData = try? Data.init(contentsOf: imageAsset.fileURL) {
                cell.imageView?.image = UIImage(data: imageData)
            }
        }
        
        return cell
    }
}
