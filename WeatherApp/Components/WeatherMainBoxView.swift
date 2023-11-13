//
//  WeatherMainBoxView.swift
//  WeatherApp
//
//  Created by Eren Berkay Dinç on 13.11.2023.
//

import SwiftUI

struct WeatherMainBoxView: View {
    
    var tempImage: Image
    var title: String
    var temp: String

    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 45, height: 45)
                .foregroundStyle(.gray.opacity(0.5))
                .overlay(
                    tempImage
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 25,height: 25)
                        .foregroundStyle(.black)
                )
                .padding(.horizontal, 5)

            VStack(spacing: 5){
                Text(title)
                    .font(.system(size: 10,weight:.medium,design: .default))
                    .fontWeight(.light)
                Text(temp + "°")
                    .font(.system(size: 20,weight:.bold,design: .default))
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    WeatherMainBoxView(tempImage: Image(systemName: "thermometer.low"), title: "Min temp", temp: "7")
        .background(Color.black)
}
