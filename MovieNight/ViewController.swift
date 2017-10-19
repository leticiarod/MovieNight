//
//  ViewController.swift
//  MovieNight
//
//  Created by Leticia Rodriguez on 10/17/17.
//  Copyright © 2017 Leticia Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let downloader = JSONDownloader()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // prueba 
        
        let endpoint = TheMovieDB.genre(resource: .movieList)
        print("endpoint \(endpoint)")
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    //completion(nil, error)
                    print("error")
                    return
                }
                
                guard let results = json["genres"] as? [[String: Any]] else {
                  //  completion(nil, .jsonParsingFailure(message: "JSON data does not contain reuslts"))
                    print("error json data ")
                    return
                }
                
                
               // completion(results, nil)
                print(results)
            }
        }
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

