//
//  AboutTableViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 02/11/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {
    var sectionTitles = ["Leave Feedback", "Follow Us"]
    var sectionContent = [["Rate us on App Store", "Tell us your feedback"],
                          ["Bing", "Facebook", "Pinterest"]]
    var links = ["http://cn.bing.com", "https://facebook.com/appcodamobile", "https://www.pinterest.com/appcoda/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            if let url = URL(string: "http://www.apple.com/itunes/charts/paid-apps") {
                UIApplication.shared.open(url)
            }
        case (0,1):
            performSegue(withIdentifier: "showWebView", sender: self)
        case (1,_):
            if let url = URL(string: links[indexPath.row]) {
                let svc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                present(svc, animated: true, completion: nil)
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
