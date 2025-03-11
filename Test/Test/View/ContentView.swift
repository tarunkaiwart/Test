//
//  ContentView.swift
//  Test
//
//  Created by shubham.garg19 on 07/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CityViewModel()
    //@State private var colllapsibleSection : Set<UUID> = []
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.sortedStates, id: \.self){
                    state in
                    
                    DisclosureGroup(state){
                        
                        //                        Section(header: Text(state).font(.headline).fontWeight(.bold))
                        //                        {
                        ForEach(viewModel.groupedCities()[state] ??  []) {  city in
                            DisclosureGroup(city.city){
                                VStack(alignment: .leading){
                                    Text("Latitude :\(city.lat)")
                                    Text("Longitude : \(city.lng)")
                                    Text("Country : \(city.country)")
                                    Text("Population: \(city.population)")
                                    Text("Proper Population: \(city.populationProper)")
                                }
                                .padding(20)
                                .background(Color(.systemGray5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        //}
                    }.listRowSeparator(.visible, edges: .bottom)
                    
                }.font(.headline)
            }
            
            .navigationTitle("Australian Cities")
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
    /*MARK: Commented code belongs to older approach followed to display cities*/
    
    //                ForEach(viewModel.cities){
    //                    city in
    //                    Section {
    //                        if colllapsibleSection.contains(city.id){
    //                            VStack(alignment: .leading){
    //                                Text("Latitude :\(city.lat)")
    //                                Text("Longitude : \(city.lng)")
    //                                Text("Country : \(city.country)")
    //                                Text("Population: \(city.population)")
    //                                Text("Admin Name : \(city.adminName)")
    //                                Text("Proper Population: \(city.populationProper)")
    //                            }
    //                            .padding()
    //                        }
    //
    //                    } header: {
    //                        HStack{
    //                            Text(city.city).font(.headline).foregroundStyle(Color.green).fontWeight(.heavy)
    //                            Spacer()
    //                            Image(systemName: colllapsibleSection.contains(city.id) ? "chevron.down" : "chevron.right").foregroundColor(.accentColor)
    //                        }.contentShape(Rectangle())
    //                            .onTapGesture {
    //                                withAnimation {
    //                                    if colllapsibleSection.contains(city.id){
    //                                        colllapsibleSection.remove(city.id)
    //                                    }else{
    //                                        colllapsibleSection.insert(city.id)
    //                                    }
    //                                }
    //                            }
    //                    }
    //
    //                }
    
}

#Preview {
    ContentView()
}



