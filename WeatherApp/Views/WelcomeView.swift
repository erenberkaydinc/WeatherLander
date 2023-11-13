//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Eren Berkay Dinç on 13.11.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            Image("WeatherLander")
                .resizable()
                .frame(width: 200,height: 200)
                .clipShape(.capsule)
            VStack(spacing: 20, content: {
                Text("Welcome to WeatherLander")
                    .bold()
                    .font(.title)

                Text("Please share your current location to get the weather in your location")
                    .padding()

            })
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
        .preferredColorScheme(.dark)
}
