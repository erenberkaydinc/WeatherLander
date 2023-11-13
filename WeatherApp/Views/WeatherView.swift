//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Eren Berkay Dinç on 13.11.2023.
//

import SwiftUI

struct WeatherView: View {
    @AppStorage("isDarkModeOn") var darkMode : Bool = false

    var weather: WeatherModel
    var body: some View {
        ZStack {
            BackgroundView(
                topColor: darkMode ? .black : .blue,
                bottomColor: darkMode ? .gray : Color("skyBlue")
            )
            VStack {
                VStack(spacing: 10) {
                    Spacer()
                        .frame(height: 20)

                    HStack {
                        Spacer()
                        Button(action: {
                            darkMode.toggle()
                        }, label: {
                            Image(systemName: "moon.circle.fill")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 35,height: 35)
                                .foregroundStyle(darkMode ? .white : Color("darkBlue"))
                        })
                        .padding(.horizontal, 30)
                    }


                    VStack(spacing: 10) {
                        //City Name
                        Text(weather.name)
                            .font(.system(size: 35,weight:.medium,design: .default))
                            .foregroundColor(.white)
                        //Date
                        Text("Today \(Date().formatted(.dateTime.month().day().hour().minute())) ")
                            .font(.system(size: 15,weight:.light,design: .default))
                            .foregroundColor(.white)

                    }
                    .padding()
                    
                    VStack {
                        //Weather Icon
                        if let weatherType = WeatherType(rawValue: weather.weather[0].main) {
                            weatherType.symbol
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 180,height: 150)
                        } else {
                            WeatherType.defaultIcon.symbol
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 180,height: 150)
                        }
                    }
                    .padding()

                    VStack {
                        // Degree
                        Text(weather.main.temp.roundDouble() + "°")
                            .font(.system(size: 70,weight:.medium,design: .default))
                            .foregroundColor(.white)
                        // Description
                        Text(weather.weather[0].main)
                            .font(.system(size: 35,weight:.medium,design: .default))
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom)
                Spacer()

                VStack {
                    BottomWeatherBox(weatherMain: weather.main)
                }

            }
            
        }
        .edgesIgnoringSafeArea(.bottom)

    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
