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
    
    var genreArray = [Genre]()
    
    var selectedIndexPathArray = [IndexPath]()
    
    
    @IBOutlet var genreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreTableView.allowsMultipleSelection = true
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
        return genreArray.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("estoy en selct")
        let cell = tableView.cellForRow(at: indexPath)
        //selectedIndexPathArray.append(indexPath)
        cell?.accessoryType = .checkmark
        
   //self.categoryArray[indexPath.row].isSelected = true
      //  genreTableView.reloadRows(at: [indexPath], with: .none)
        genreTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)

    //    tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("estoy en didDeselectRowAt")
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
       // tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = genreArray[indexPath.row].name
        
   /*     cell.accessoryType = .none
        for sip in selectedIndexPathArray {
            if indexPath == sip {
                cell.accessoryType = .checkmark
            }
        }
       */
        return cell
    }
    
    func getGenres () {
        group.enter()
        movieClient.getGenres() { results, error in
            if let error = error  {
                print("error \(error)")
                
            }
            
            for genre in results {
                self.genreArray.append(genre)
            }
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            print("Finalice ")
            self.genreTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getGenres()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }

}
