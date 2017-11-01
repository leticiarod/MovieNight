//
//  ViewController.swift
//  MovieNight
//
//  Created by Leticia Rodriguez on 10/17/17.
//  Copyright © 2017 Leticia Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let client = MovieNightAPIClient()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // prueba 
     
        client.getArtists() { results, error in
                print("resultsssss \(results)")
        }
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

