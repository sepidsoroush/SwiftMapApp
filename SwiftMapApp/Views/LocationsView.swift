//
//  LocationsView.swift
//  SwiftMapApp
//
//  Created by Sepideh Soroush on 10/20/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapRegion)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
