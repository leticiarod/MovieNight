//
//  ViewController.swift
//  MovieNight
//
//  Created by Leticia Rodriguez on 10/17/17.
//  Copyright © 2017 Leticia Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var viewResultsButton: UIButton!
    @IBOutlet weak var watcherOneBubbleImageView: UIImageView!
    @IBOutlet weak var watcherTwoBubbleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // settings to viewResultsButton
        viewResultsButton.isEnabled = false
        viewResultsButton.setTitleColor(UIColor.lightGray, for: .disabled)
        
        // adding tap gesture to watcher one empty bubbles image view
        let tapGestureRecognizerBubbleWatcherOne = UITapGestureRecognizer(target: self, action: #selector(bubbleWatcherOneTapped(tapGestureRecognizer:)))
        watcherOneBubbleImageView.addGestureRecognizer(tapGestureRecognizerBubbleWatcherOne)
        
        // adding tap gesture to watcher two empty bubbles image view
        let tapGestureRecognizerBubbleWatcherTwo = UITapGestureRecognizer(target: self, action: #selector(bubbleWatcherTwoTapped(tapGestureRecognizer:)))
        watcherTwoBubbleImageView.addGestureRecognizer(tapGestureRecognizerBubbleWatcherTwo)
    
    // merge test
        
        // test
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func bubbleWatcherOneTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        // Your action
        print("toque la burbuja 1!")
    }
    
    func bubbleWatcherTwoTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
       // let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        // Your action
        print("toque la burbuja 2!")
    }

}

