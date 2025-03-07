//
//  City.swift
//  Test
//
//  Created by shubham.garg19 on 07/03/25.
//

import Foundation

struct City : Identifiable, Codable, Equatable
{
    let id = UUID()
    let city : String
    let lat : String
    let lng : String
    let country : String
    let iso2 : String
    let adminName : String
    let capital : String
    let population : String
    let populationProper : String
    
    enum CodingKeys : String, CodingKey{
        case city, lat, lng, country, iso2, capital, population
        case adminName = "admin_name"
        case populationProper = "population_proper"
    }
}
