//
//  MovieNightAPIClient.swift
//  MovieNight
//
//  Created by Leticia Rodriguez on 10/17/17.
//  Copyright © 2017 Leticia Rodriguez. All rights reserved.
//

import Foundation

class MovieNightAPIClient {
    
    let downloader = JSONDownloader()

    func getGenres(completion: @escaping ([Genre], MovieNightError?) -> Void){
        let endpoint = TheMovieDB.genre(resource: .movieList)
        print("endpoint \(endpoint)")
        
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    print("error")
                    completion([], error)
                    return
                }
                guard let results = json["genres"] as? [[String: Any]] else {
                    print("error json data ")
                    completion([], .jsonParsingFailure(message: "JSON data does not contain genres"))
                    return
                }
                // used flat map because we need transform the contents of an array of arrays, into a linear array
                let genres = results.flatMap { Genre(json: $0 )}
                completion(genres, nil)
            }
        }
        task.resume()
    }
    
    func getArtists(completion: @escaping ([People], MovieNightError?) -> Void){
        let endpoint = TheMovieDB.person(resource: .popular)
        print("endpoint \(endpoint)")
        
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    print("error")
                    completion([], error)
                    return
                }
                guard let results = json["results"] as? [[String: Any]] else {
                    print("error json data ")
                    completion([], .jsonParsingFailure(message: "JSON data does not contain results"))
                    return
                }
                
                // used flat map because we need transform the contents of an array of arrays, into a linear array
                let people = results.flatMap { People(json: $0 )}
                completion(people, nil)
            }
        }
        task.resume()
    }
}
