//
//  CityViewModel.swift
//  Test
//
//  Created by shubham.garg19 on 07/03/25.
//

import Foundation

class CityViewModel  : ObservableObject{
    @Published var cities : [City] = []
    @Published var isReversed : Bool = false
    
    init (){
        loadJSON()
    }
    
    /*MARK: Load JSON locally*/
    
    func loadJSON(){
        if let citiesURL = Bundle.main.url(forResource: "au_cities", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: citiesURL)
                let dedcodedResponse = try JSONDecoder().decode([City].self, from: data)
                cities = dedcodedResponse
            } catch {
                print("Error while decoding the response")
            }
        }
    }
    
    func toggleCities(){
        isReversed.toggle()
    }
    //Group the cities under state name/admin name
    func groupedCities() -> [String : [City]]{
        Dictionary(grouping: cities) { $0.adminName }
    }
    
    //Computed property to sort & reverse the states
    var sortedStates : [String] {
        let states = groupedCities().keys.sorted()
        return isReversed ? states.reversed() : states
    }
    
}
