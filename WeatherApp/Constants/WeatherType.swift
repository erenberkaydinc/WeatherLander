//
//  WeatherType.swift
//  WeatherApp
//
//  Created by Eren Berkay Dinç on 13.11.2023.
//

import Foundation
import SwiftUI

enum WeatherType: String {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case thunderstorm = "Thunderstorm"
    case snow = "Snow"
    case mist = "Mist"
    case defaultIcon = "Default"

    var symbol: Image {
        switch self {
        case .clear:
            return Image(systemName: "sun.max.fill")
        case .clouds:
            return Image(systemName: "cloud.fill")
        case .rain:
            return Image(systemName: "cloud.rain.fill")
        case .thunderstorm:
            return Image(systemName: "cloud.bolt.fill")
        case .snow:
            return Image(systemName: "snow")
        case .mist:
            return Image(systemName: "cloud.fog.fill")
        case .defaultIcon:
            return Image("WeatherLander")
        }
    }
}
