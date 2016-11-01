//
//  WalkthroughPageViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 01/11/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit

class PageContainer: UIPageViewController, UIPageViewControllerDataSource {

    var pageHeadings = ["Personalize", "Locate", "Discover"]
    var pageImages = ["foodpin-intro-1", "foodpin-intro-2", "foodpin-intro-3"]
    var pageContent = ["Pin your favorite restaurants and create your own food guide",
                       "Search and locate your favourite restaurant on Maps",
                       "Find restaurants pinned by your friends and other foodies around the world"]
    
    override func viewDidLoad() {
        print("viewDidLoad")
        
        dataSource = self
        if let startingPage = page(at: 0) {
            setViewControllers([startingPage], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("viewControllerBefore")
        
        var index = (viewController as! SinglePage).index
        index -= 1
        
        return page(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter
        viewController: UIViewController) -> UIViewController? {
        print("viewControllerAfter")
        
        var index = (viewController as! SinglePage).index
        index += 1
        
        return page(at: index)
        
    }
    
    func page(at index: Int) -> SinglePage? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        if let page = storyboard?.instantiateViewController(withIdentifier: "SinglePage")  as? SinglePage {
            page.imageFile = pageImages[index]
            page.heading = pageHeadings[index]
            page.content = pageContent[index]
            page.index = index
            
            return page
        }
        
        return nil
    }
    /*
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        print("presentationCount: \(pageHeadings.count)")
        return pageHeadings.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        print("presentationIndex")
        
        if let page = storyboard?.instantiateViewController(withIdentifier: "SinglePage")  as? SinglePage {
            print("page index is: \(page.index)")
            return page.index
        }
        
        print("no page found, return 0")
        return 0
    }
    */
    
    func forward(index: Int) {
        if let nextPage = page(at: index + 1) {
            setViewControllers([nextPage], direction: .forward, animated: true, completion: nil)
        }
    }
}
