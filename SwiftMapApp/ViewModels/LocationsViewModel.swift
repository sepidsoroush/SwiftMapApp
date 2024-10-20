//
//  LocationsViewModel.swift
//  SwiftMapApp
//
//  Created by Sepideh Soroush on 10/20/24.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
