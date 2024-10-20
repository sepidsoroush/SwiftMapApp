//
//  SwiftMapAppApp.swift
//  SwiftMapApp
//
//  Created by Sepideh Soroush on 10/20/24.
//

import SwiftUI

@main
struct SwiftMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
