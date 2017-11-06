//
//  ArtistTableViewController.swift
//  MovieNight
//
//  Created by Leticia Rodriguez on 10/30/17.
//  Copyright © 2017 Leticia Rodriguez. All rights reserved.
//

import UIKit

class ArtistTableViewController: UITableViewController {

    let movieClient = MovieNightAPIClient()
    
    let group = DispatchGroup()
    
    var artistsArray = [People]()
    
    var selectedIndexPathArray = [IndexPath]()
    
    
    @IBOutlet var artistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsMultipleSelection = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsArray.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("estoy en selct")
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)

    }

    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("estoy en didDeselectRowAt")
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
       }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = artistsArray[indexPath.row].name
        
        return cell
    }
    
    func getArtists () {
        group.enter()
        movieClient.getArtists() { results, error in
            if let error = error  {
                print("error \(error)")
            }
            
            for genre in results {
                self.artistsArray.append(genre)
            }
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            print("Finalice ")
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getArtists()
    }

    // MARK: - Navigation
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("estoy en el segue !!")
        
        if segue.identifier == "showGenres" {
            print("estoy en el segue if !!")
        }
        
    }

}
