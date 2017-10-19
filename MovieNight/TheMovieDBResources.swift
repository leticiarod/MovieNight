//
//  TheMovieDBResources.swift
//  MovieNight
//
//  Created by Leticia Rodriguez on 10/18/17.
//  Copyright © 2017 Leticia Rodriguez. All rights reserved.
//

import Foundation

enum DiscoverResources {
    case movie
    case TV
}

extension DiscoverResources: CustomStringConvertible {
    var description: String {
        switch self {
        case .movie: return "movie"
        case .TV: return "tv"
        }
    }
}

enum PersonResources {
    case details(personID: String)
    case movieCredits(personID: String)
    case tvCredits(personID: String)
    case combinedCredits(personID: String)
    case externalIDs(personID: String)
    case images(personID: String)
    case taggedImages(personID: String)
    case changes(personID: String)
    case latest
    case popular
}

extension PersonResources: CustomStringConvertible {
    var description: String{
        switch self {
        case .details(let personID): return personID
        case .movieCredits(let personID): return "\(personID)/movie_credits"
        case .tvCredits(let personID): return "\(personID)/tv_credits"
        case .combinedCredits(let personID): return "\(personID)/combined_credits"
        case .externalIDs(let personID): return "\(personID)/external_ids"
        case .images(let personID): return "\(personID)/images"
        case .taggedImages(let personID): return "\(personID)/tagged_images"
        case .changes(let personID): return "\(personID)/changes"
        case .latest: return "latest"
        case .popular: return "popular"
        }
    }
}

enum GenreResources {
    case movieList
    case tvList
}

extension GenreResources: CustomStringConvertible {
    var description: String {
        switch self {
        case .movieList: return "movie/list"
        case .tvList: return "tv/list"
        }
    }
}

enum SearchResources {
    case companies
    case collections
    case keywords
    case movies
    case multisearch
    case people
    case tvShows
}

extension SearchResources: CustomStringConvertible {
    var description: String {
        switch self {
        case .companies: return "company"
        case .collections: return "collection"
        case .keywords: return "keyword"
        case .movies: return "movie"
        case .multisearch: return "multi"
        case .people: return "person"
        case .tvShows: return "tv"
        }
    }
}
