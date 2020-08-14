//
//  APIResponses.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/20/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//



import Foundation

struct FilmSummary: Codable {
  let count: Int?
  let results: [Film]?
}

struct Film: Codable {
  let title: String
  let episodeId: Int
  let openingCrawl: String
  let director: String
    
  enum CodingKeys: String, CodingKey {
    case title
    case episodeId = "episode_id"
    case openingCrawl = "opening_crawl"
    case director
  }
  
  init(title: String,
       episodeId: Int , opening_crawl: String , director: String) {
    self.title = title
    self.episodeId = episodeId
    self.openingCrawl = opening_crawl
    self.director =  director
  }
}

struct People: Codable {
  let count: Int
  let next: String?
  let prev: String?
  let results: [Person]?
}

struct Person: Codable {
  let name: String
    init(name: String) {
        self.name = name
    }
}

struct PlanetSummery : Codable {
    let count: Int
    let next: String?
    let prev: String?
    let results: [Planet]?
}

struct Planet: Codable {
    let name: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    
    init(name: String , diameter : String , climate : String , gravity: String , terrain: String) {
        self.name = name
        self.diameter = diameter
        self.climate = climate
        self.terrain = terrain
        self.gravity = gravity
    }
}

struct StarshipsSummery : Codable {
    let count: Int
    let next: String?
    let prev: String?
    let results: [Starship]?
    
}
struct Starship: Codable {
    let name: String
    let model : String
    let manufacturer : String
    let cost_in_credits : String
    let starship_class : String
    
    init(name : String , model : String , manufacturer: String , cost_in_credits: String , starship_class : String) {
        self.name = name
        self.model = model
        self.manufacturer = manufacturer
        self.cost_in_credits = cost_in_credits
        self.starship_class = starship_class
    }
}

struct SpeciesSummary: Codable {
    let count: Int
    let next: String?
    let prev: String?
    let results:[Specie]?
}

struct Specie: Codable {
    let name: String
    let classification: String
    let skin_colors : String
    
    init(name : String , classification: String , skin_colors : String) {
        self.name = name
        self.classification = classification
        self.skin_colors = skin_colors
    }
}


struct VehiclesSummary : Codable {
    let count: Int
    let next: String?
    let prev: String?
    let results: [Vehicle]?
}

struct Vehicle: Codable {
    let name : String
    let model : String
    let manufacturer: String
    let cost_in_credits : String
    let vehicle_class: String
    
    init(name : String , model : String , manufacturer: String , cost_in_credits: String, vehicle_class : String) {
        self.name = name
        self.model = model
        self.manufacturer = manufacturer
        self.cost_in_credits = cost_in_credits
        self.vehicle_class = vehicle_class
    }
}

