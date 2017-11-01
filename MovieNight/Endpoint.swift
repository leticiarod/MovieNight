//
//  Endpoint.swift
//  MovieNight
//
//  Created by Leticia Rodriguez on 10/18/17.
//  Copyright © 2017 Leticia Rodriguez. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        print("components \(components)")
        return components
    }
    
    var request: URLRequest {
        print("url components \(urlComponents)")
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum TheMovieDB {
    case discover(resource: DiscoverResources, artistArray: [String], genreArray: [String], companyArray: [String])
    case person(resource: PersonResources)
    case genre(resource: GenreResources)
    case search(resource: SearchResources)
}

extension TheMovieDB: Endpoint {
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .discover: return "/3/discover"
        case .person(let resource): return "/3/person/\(resource.description)"
        case .genre(let resource): return "/3/genre/\(resource.description)"
        case .search: return "/3/search"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self{
        case .discover(let resource, let artistArray, let genreArray, let companyArray):
            
            // Adding the resource to the base component of the URL
            let _ = URL(string: resource.description, relativeTo: URL(string: base)!)!
            var result = [URLQueryItem]()
            
            // Adds the API key to the url as a query item
            let discoverAPIKeyItem = URLQueryItem(name: "api_key", value: APIKey.apiKey)
            result.append(discoverAPIKeyItem)
            
            // Adds the artist secuence to the url as a query item.
            let discoverArtistArrayItem = URLQueryItem(name: "with_people", value: artistArray.joined(separator: "|"))
            result.append(discoverArtistArrayItem)
            
            // Adds the genre secuence to the url as a query item.
            let discoverGenreArrayItem = URLQueryItem(name: "with_genres", value: genreArray.joined(separator: "|"))
            result.append(discoverGenreArrayItem)

            // Adds the company secuence to the url as a query item.
            let discoverCompanyArray = URLQueryItem(name: "with_companies", value: companyArray.joined(separator: "|"))
            result.append(discoverCompanyArray)
            
            return result
            
        case .person:
            
            // Adding the resource to the base component of the URL
            //let _ = URL(string: resource.description, relativeTo: URL(string: base)!)!
            
            var result = [URLQueryItem]()
            
            // Adds the API key to the url as a query item
            let discoverAPIKeyItem = URLQueryItem(name: "api_key", value: APIKey.apiKey)
            result.append(discoverAPIKeyItem)
            
            
            return result
            
        case .genre(let resource):
            print("pase por aca ")
            // Adding the resource to the base component of the URL
            print("resource.description \(resource.description)")
            //let nuevaURL = URL(string: resource.description, relativeTo: URL(string: base)!)!
            
          //  base.append(resource.description)
            
            
           // print("nueva URL \(String(describing: nuevaURL))")
            
            var result = [URLQueryItem]()
            
            // Adds the API key to the url as a query item
            let discoverAPIKeyItem = URLQueryItem(name: "api_key", value: APIKey.apiKey)
            result.append(discoverAPIKeyItem)
            
            print("results \(result)")
            
            return result
            
        case .search(let resource):
            var result = [URLQueryItem]()
            
            // Adding the resource to the base component of the URL
            let _ = URL(string: resource.description, relativeTo: URL(string: base))
            
            // Adds the API key to the url as a query item
            let discoverAPIKeyItem = URLQueryItem(name: "api_key", value: APIKey.apiKey)
            result.append(discoverAPIKeyItem)
            
            return result
        }
    }
}
