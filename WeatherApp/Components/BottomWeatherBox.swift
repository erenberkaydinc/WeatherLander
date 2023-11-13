//
//  BottomWeatherBox.swift
//  WeatherApp
//
//  Created by Eren Berkay Dinç on 13.11.2023.
//

import SwiftUI

struct BottomWeatherBox: View {
    var weatherMain: Main
    var body: some View {

            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 150)
                .clipShape(
                    .rect(
                        topLeadingRadius: 25,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 25
                    )
                )
                .overlay {
                    VStack {
                        HStack {
                            Text("Latest weather status")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(.black)

                                .padding(.horizontal)
                            Spacer()
                        }
                        .padding(.bottom)

                        HStack {
                            WeatherMainBoxView(tempImage: Image(systemName: "thermometer.low"), title: "Min temp", temp: weatherMain.tempMin.description)
                                .padding(.horizontal)

                            Spacer()

                            WeatherMainBoxView(tempImage: Image(systemName: "thermometer.high"), title: "Max temp", temp: weatherMain.tempMax.description)
                                .padding(.horizontal)
                        }

                    }
                    .padding()
                    
                    Spacer()
                        .frame(height: 30)

                }
                .foregroundStyle(
                    Color.white.opacity(0.5)
                )


    }
}

#Preview {
    BottomWeatherBox(weatherMain: previewWeather.main)
}
