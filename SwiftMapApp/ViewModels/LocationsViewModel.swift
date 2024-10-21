//
//  LocationsViewModel.swift
//  SwiftMapApp
//
//  Created by Sepideh Soroush on 10/20/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MapCameraPosition
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.mapRegion = .region(MKCoordinateRegion(
                         center: locations.first!.coordinates,
                         span: mapSpan
                     ))
    }
    
    private func updateMapRegion(location : Location) {
          withAnimation(.easeInOut) {
              mapRegion = .region(MKCoordinateRegion(
                  center: location.coordinates,
                  span: mapSpan
              ))
          }
      }
}
