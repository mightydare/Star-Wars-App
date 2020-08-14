//
//  NetworkManager.swift
//  StarWarsApp
//
//  Created by Darko Stojanov on 7/20/20.
//  Copyright © 2020 Darko Stojanov. All rights reserved.
//

import Foundation

final class NetworkManager {
    var films: [Film] = []
    private let domainUrlString = "https://swapi.dev/api/"
    private let filmUrlString = "https://swapi.dev/api/films/"
    private let peopleUrlString = "http://swapi.dev/api/people/?page="
    private let planetUrlString = "https://swapi.dev/api/planets/"
    private let starshipUrlString = "https://swapi.dev/api/starships/"
    private let specieUrlString = "https://swapi.dev/api/species/"
    private let vehiclesUrlString = "https://swapi.dev/api/vehicles"
    
    func fetchFilms(completionHandler: @escaping ([Film]) -> Void){
        let url = URL(string: filmUrlString)
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let filmsData = try decoder.decode(FilmSummary.self, from: data!)
                        completionHandler(filmsData.results ?? [])
                }
                   
                    
                catch {
                    print("Error on Films")
                    completionHandler([])
                }
            }
        }
        dataTask.resume()
    }
    
    
    
    func fetchPeople(page : String , completionHandler: @escaping ([Person]) -> Void){
        let url = URL(string: peopleUrlString + page)!
               guard url != nil else {
                   return
               }
               let session = URLSession.shared
               let dataTask = session.dataTask(with: url) { (data, response, error) in
                   if error == nil && data != nil {
                       let decoder = JSONDecoder()
                       do {
                           let peopleData = try decoder.decode(People.self, from: data!)
                               completionHandler(peopleData.results ?? [])
                            
                       }
                       catch {
                           print("Error on People")
                       }
                   }
               }
               dataTask.resume()
    }
    
    func fetchPlanets(completionHandler: @escaping ([Planet]) -> Void){
        
        let url = URL(string: planetUrlString)!
               guard url != nil else {
                   return
               }
               let session = URLSession.shared
               let dataTask = session.dataTask(with: url) { (data, response, error) in
                   if error == nil && data != nil {
                       let decoder = JSONDecoder()
                       do {
                           let planetData = try decoder.decode(PlanetSummery.self, from: data!)
                               completionHandler(planetData.results ?? [])
                            
                       }
                       catch {
                           print("Error on Planets")
                       }
                   }
               }
               dataTask.resume()
    }
    
    func fetchStarships(completionHandler: @escaping ([Starship]) -> Void){
        
        let url = URL(string: starshipUrlString)!
               guard url != nil else {
                   return
               }
               let session = URLSession.shared
               let dataTask = session.dataTask(with: url) { (data, response, error) in
                   if error == nil && data != nil {
                       let decoder = JSONDecoder()
                       do {
                           let starshipData = try decoder.decode(StarshipsSummery.self, from: data!)
                               completionHandler(starshipData.results ?? [])
                            
                       }
                       catch {
                           print("Error on Starships")
                       }
                   }
               }
               dataTask.resume()
    }
    
    func fetchSpecies(completionHandler: @escaping ([Specie]) -> Void){
        
        let url = URL(string: specieUrlString)!
               guard url != nil else {
                   return
               }
               let session = URLSession.shared
               let dataTask = session.dataTask(with: url) { (data, response, error) in
                   if error == nil && data != nil {
                       let decoder = JSONDecoder()
                       do {
                           let speciesData = try decoder.decode(SpeciesSummary.self, from: data!)
                               completionHandler(speciesData.results ?? [])
                            
                       }
                       catch {
                           print("Error on Species")
                       }
                   }
               }
               dataTask.resume()
    }
    
    func fetchVehicles(completionHandler: @escaping ([Vehicle]) -> Void){
        
        let url = URL(string: vehiclesUrlString)!
               guard url != nil else {
                   return
               }
               let session = URLSession.shared
               let dataTask = session.dataTask(with: url) { (data, response, error) in
                   if error == nil && data != nil {
                       let decoder = JSONDecoder()
                       do {
                        let vehiclesData = try decoder.decode(VehiclesSummary.self, from: data!)
                               completionHandler(vehiclesData.results ?? [])
                            
                       }
                       catch {
                           print("Error on Vehicles")
                       }
                   }
               }
               dataTask.resume()
    }
}
