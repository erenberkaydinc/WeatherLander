//
//  WeatherAppSwiftUIApp.swift
//  WeatherAppSwiftUI
//
//  Created by Eren Berkay Dinç on 11.11.2022.
//

import SwiftUI

@main
struct WeatherApp: App {
    @EnvironmentObject var locationManager: LocationManager

    @AppStorage("isDarkModeOn") var darkMode : Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LocationManager.shared)
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
    
    
}
