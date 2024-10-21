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
    
    @Published var showLocationsList: Bool = false
    
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
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(nextLocation: Location){
        withAnimation(.easeInOut) {
            mapLocation = nextLocation
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("Couldn't find current index in the locations array")
            return
        }
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {return}
            showNextLocation(nextLocation: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(nextLocation: nextLocation)
    }
}
