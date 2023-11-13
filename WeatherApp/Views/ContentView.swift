//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Eren Berkay Dinç on 11.11.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    var networkManager = NetworkManager.shared
    @State var weather: WeatherModel?

    @AppStorage("isDarkModeOn") var darkMode : Bool = false

    var body: some View {
        VStack {
            if let location = locationManager.location {
                    if let weather = weather {
                        WeatherView(weather: weather)
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    weather = try await networkManager.fetchCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                } catch {
                                    print("Error getting weather \(error)")
                                }
                            }
                    }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                }
            }


        }
        .foregroundColor(.white)
        .background(
            BackgroundView(
                topColor: darkMode ? .black : .blue,
                bottomColor: darkMode ? .gray :Color("skyBlue")
            )
            .opacity(0.8)
        )
        .preferredColorScheme(.dark)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager.shared)
    }
}
