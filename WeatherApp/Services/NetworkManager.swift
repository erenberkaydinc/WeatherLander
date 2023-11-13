//
//  APIManager.swift
//  WeatherApp
//
//  Created by Eren Berkay Dinç on 23.11.2022.
//
import SwiftUI
import CoreLocation

class NetworkManager {
    static var shared = NetworkManager()
    private let baseURL = "https://api.openweathermap.org/data/2.5/"
    private let apiKey = "typeYourApiKey"

    func fetchCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, tempType: TempType = .celsius) async throws -> WeatherModel {
        guard let url = URL(string: "\(baseURL)/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=\(tempType.rawValue)") else {
            // Handle the case where the URL is invalid
            fatalError("Invalid URL")
        }

        let urlRequest = URLRequest(url: url)

        let (data,response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data!")}

        let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)

        return decodedData
    }

//    func fetchWeather() {
//
//        guard let url = URL(string: "\(baseURL)/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=\(tempType.rawValue)") else {
//            // Handle the case where the URL is invalid
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                // Handle the case where there's an error during the data task
//                print("Error fetching weather data: \(error)")
//                return
//            }
//
//            guard let data = data else {
//                // Handle the case where there's no data
//                print("No data received")
//                return
//            }
//
//            do {
//                let response = try JSONDecoder().decode(Weather.self, from: data)
//                DispatchQueue.main.async {
//
//                }
//                print(response)
//            } catch {
//                // Handle the case where decoding fails
//                print("Error decoding weather data: \(error)")
//            }
//        }
//
//        task.resume()
//    }
}
