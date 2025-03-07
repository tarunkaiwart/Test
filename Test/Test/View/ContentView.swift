//
//  ContentView.swift
//  Test
//
//  Created by shubham.garg19 on 07/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CityViewModel()
    @State private var colllapsibleSection : Set<UUID> = []
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.cities){
                    city in
                    Section {
                        if colllapsibleSection.contains(city.id){
                            VStack(alignment: .leading){
                                Text("Latitude :\(city.lat)")
                                Text("Longitude : \(city.lng)")
                                Text("Country : \(city.country)")
                                Text("Population: \(city.population)")
                                Text("Admin Name : \(city.adminName)")
                                Text("Proper Population: \(city.populationProper)")
                            }
                            .padding()
                        }
                    
                    } header: {
                        HStack{
                            Text(city.city).font(.headline).foregroundStyle(Color.green).fontWeight(.heavy)
                            Spacer()
                            Image(systemName: colllapsibleSection.contains(city.id) ? "chevron.down" : "chevron.right").foregroundColor(.accentColor)
                        }.contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    if colllapsibleSection.contains(city.id){
                                        colllapsibleSection.remove(city.id)
                                    }else{
                                        colllapsibleSection.insert(city.id)
                                    }
                                }
                            }
                    }
                
                }
            }
            
            .navigationTitle("Cities")
            .toolbar {
                ToolbarItem(placement: .confirmationAction){
                    
                Button(action: {
                        viewModel.toggleCities()
                    }){
                        Image(systemName: "arrow.up.arrow.down")
                    }
                }}
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
